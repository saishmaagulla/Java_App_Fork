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
          docker build -t saishma1201/java-poc:1 .
          """
        }
      }
  }
  }
