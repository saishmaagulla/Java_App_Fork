pipeline{
  agent any
    stages{
      stage('build') {
        steps{
        echo 'this is build step'
          sh """
          ls
          """
        }
      }
      stage('docker build') {
        steps{
        echo 'this is docker build step'
          sh """
          sudo docker login -u saishma1201 -p saishma1201
          sudo docker build -t saishma1201/java-poc:\$(git log -1 --pretty=%h) .
           sudo docker push saishma1201/java-poc:\$(git log -1 --pretty=%h)
          sudo docker rmi saishma1201/java-poc:\$(git log -1 --pretty=%h)
          """
        }
      }
      stage('kubernetes get images ') {
        steps{
        echo 'this is build step'
          sh """
         cd ~
         kubectl --kubeconfig=config get pods
          """
        }
      }
      stage('update the kubernetes image') {
        steps{
          sh """
          sudo su
          cd ~
          echo "updating the image"
          echo "kubectl --kubeconfig=config set image deployment/test-java-dep test-con=saishma1201/java-poc:\$(git log -1 --pretty=%h)"
          kubectl --kubeconfig=config set image deployment/test-java-dep test-con=saishma1201/java-poc:\$(git log -1 --pretty=%h)
          """
        }
      }
  }
  }
