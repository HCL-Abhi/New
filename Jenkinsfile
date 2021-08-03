@Library('piper-library-os') 

node() {
  
  stage('Deploy') {
    gctsDeploy(
        script: this,
        host: 'https://abap.server.com:port',
        client: '200',
        abapCredentialsId: 'ABAPUserPasswordCredentialsId',
        repository: 'myrepo',
      )
  }

