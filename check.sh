#!/bin/bash
if [ -d latest_snapshot ];
then
echo "directory exists"
else
echo "directory doesnot exists"
mkdir latest_snapshot
cd latest_snapshot
fi
