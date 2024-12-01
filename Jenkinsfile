pipeline {

       agent any
        tools { 
        nodejs 'NodeJS'
       }        
       environment { 
                 DOCKER_HUB_REPO= 'shubhamsahu22/compelete-cicd-01'
                 JOB_NAME_NOW= 'cicd01'
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
                             docker.build("${JOB_NAME_NOW}:latest") 
                         }
                  }
               }
             stage('trivy scan') { 
                     steps { 
                           sh  'trivy --severity HIGH,CRITICAL --no-progress --format table -o trivy-report.html image ${JOB_NAME_NOW}:latest'
                       }
             }
          }


}

