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
          sudo docker build -t saishma1201/java-poc:${BUILD_NUMBER} .
          """
        }
      }
      stage('docker push ') {
        steps{
        echo 'this is build step'
          sh """
          sudo docker push saishma1201/java-poc:${BUILD_NUMBER}
          sudo docker rmi saishma1201/java-poc:${BUILD_NUMBER}
          """
        }
      }
      stage('update the kubernetes image') {
        steps{
          sh """
          kubectl get deployments
          """
        }
      }
  }
  }
