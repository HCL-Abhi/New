@Library('piper-library-os')_ 

node () 
   {
  
  
  stage('DeployCommit') 
    gctsDeploy(
        script: this,
        host: 'https://abap.server.com:port',
        client: '200',
        abapCredentialsId: 'ABAPUserPasswordCredentialsId',
        repository: 'myrepo',
      )
  
  
  stage('RunUnitTest') 
    gctsExecuteABAPUnitTests(
      script: this
    )
  
    stage('RollbackCommit') 
    gctsRollback(
      script: this
    )

}

