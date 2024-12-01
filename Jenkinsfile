pipeline {

       agent any
        tools { 
        nodejs 'NodeJS'
       }        
       environment { 
                 DOCKER_HUB_REPO= 'shubhamsahu22/compelete-cicd-01'
           
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
              stage('docker') {
                  steps { 
                      script { 
                             docker.build("${DOCKER_HUB_REPO}:latest") 
                         }
                  }
               }

          }


}

