pipeline {

       agent any

              
            stages {
              stage('gitgub') { 
                  steps  {
                         git branch: 'main', credentialsId: 'github-token-key', url: 'https://github.com/ShubhamSahu22/Complete_CICD_02.git'
                         
                       }
                  }   
          }


}

