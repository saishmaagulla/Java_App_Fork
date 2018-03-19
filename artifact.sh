#!/bin/bash

# downloads latest version of an artifact from artifactory

set -e

usage(){
  echo "Usage: $*" >&2
  exit 64
}

repo=""
group=""
artifact=""
while getopts r:g:a: OPT; do
  case "${OPT}" in
    r) repo="${OPTARG}";;
    g) group="${OPTARG}";;
    a) artifact="${OPTARG}";;
  esac
done
shift $(( $OPTIND - 1 ))

if [ -z "${repo}" ] || [ -z "${group}" ] || [ -z "${artifact}" ]; then
  usage "-r REPOSITORY -g GROUPID -a ARTIFACTID"
fi

# Maven artifact location
ga=${group//./\/}/$artifact
repopath=$repo/$ga
version=`curl -s $repopath/maven-metadata.xml | grep latest | sed "s/.*<latest>\([^<]*\)<\/latest>.*/\1/"`
build=`curl -s $repopath/$version/maven-metadata.xml | grep '<value>' | head -1 | sed "s/.*<value>\([^<]*\)<\/value>.*/\1/"`
war=$artifact-$build.war
url=$repopath/$version/$jar

# Download
# echo $url
curl $url
