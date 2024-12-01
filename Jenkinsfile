pipeline {

       agent any
        tools { 
        nodejs 'NodeJS'
       }              
            stages {
              stage('gitgub') { 
                  steps  {
                         git branch: 'main', credentialsId: 'github-token-key', url: 'https://github.com/ShubhamSahu22/Complete_CICD_02.git'
                         
                       }
                  }   
              stage('Unit test') { 
                      steps { 
                       sh 'npm test'
                       sh 'npm install' 
                  }
              }
          }


}

