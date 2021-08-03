@Library('piper-library-os')_ 

node () 
   {
  
  
  stage('DeployCommit') 
    gctsDeploy(
        script: this,
        host: 'https://hcluks4hana.hcldigilabs.com:8001',
        client: '200',
        abapCredentialsId: 'AbapSystem',
        repository: 'OpenSAP',
      )
  
  
  stage('RunUnitTest') 
    gctsExecuteABAPUnitTests(
      script: this,
      host: 'https://hcluks4hana.hcldigilabs.com:8001',
      client: '200',
      abapCredentialsId: 'AbapSystem',
      repository: 'OpenSAP'
  )
       
  
    stage('RollbackCommit') 
    gctsRollback(
      script: this,
      host: "https://hcluks4hana.hcldigilabs.com:8001",
      client: "200",
      abapCredentialsId: 'AbapSystem',
      repository: "OpenSAP"
  )
}

