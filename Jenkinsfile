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
          sudo docker build -t saishma1201/java-poc:1 .
          """
        }
      }
  }
  }
