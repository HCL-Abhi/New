@Library('piper-library-os')_ 

node () 
{
  
    stage('DeployCommit') 
    gctsDeploy(
  script: this,
  host: 'hclutl1909.hcldigilabs.com:8001',
  abapCredentialsId: 'ABAPUserPasswordCredentialsId',
  repository: 'OpenSAP',
  remoteRepositoryURL: "https://github.com/abhilashhaa/OpenSAPDemo.git",
  role: 'Provided',
  vSID: 'FEF',
  branch: 'master',
  commit: '$PIPER_commit',
  rollback: false,
  
)  
  
  stage('RunUnitTest') 
    gctsExecuteABAPUnitTests(
      script: this,
      host: 'hcluks4hana.hcldigilabs.com:8001',
      client: '200',
      abapCredentialsId: 'AbapSystem',
      repository: 'OpenSAP'
  )
       
  
    stage('RollbackCommit') 
    gctsRollback(
      script: this,
      host: "hcluks4hana.hcldigilabs.com:8001",
      client: "200",
      abapCredentialsId: 'AbapSystem',
      repository: "OpenSAP"
  )
}

