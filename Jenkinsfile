@Library('piper-library-os')_ 

node () 
{
  stage('CreateRepository')
  gctsCreateRepository(
  script: this,
  host: 'https://hclutl1909.hcldigilabs.com:8001',
  client: '200',
  abapCredentialsId: 'ABAPUserPasswordCredentialsId',
  repository: 'FAIL',
  remoteRepositoryURL: 'https://github.com/abhilashhaa/OpenSAPDemo.git',
  role: 'TARGET',
  vSID: 'GEF'
  )
  
  
  stage('CloneRepository')
  
  gctsCloneRepository(
  script: this,
  host: 'https://hclutl1909.hcldigilabs.com:8001',
  client: '200',
  abapCredentialsId: 'ABAPUserPasswordCredentialsId',
  repository: 'myU09'
)
  
    stage('DeployCommit') 
    gctsDeploy(
  script: this,
  host: 'https://hclutl1909.hcldigilabs.com:8001',
  abapCredentialsId: 'ABAPUserPasswordCredentialsId',
  repository: 'myU09',
  remoteRepositoryURL: "https://github.com/abhilashhaa/OpenSAPDemo.git",
  role: 'TARGET',
  vSID: 'FEF',
  rollback: true,
 
  
)  
  
  stage('RunUnitTest') 
    gctsExecuteABAPUnitTests(
      script: this,
      host: 'https://hclutl1909.hcldigilabs.com:8001',
      client: '200',
      abapCredentialsId: 'ABAPUserPasswordCredentialsId',
      repository: 'OpenSAP'
  )
       
  
    stage('RollbackCommit') 
    gctsRollback(
      script: this,
      host: "https://hcluks4hana.hcldigilabs.com:8001/",
      client: "200",
      abapCredentialsId: 'AbapSystem',
      repository: "OpenSAP"
  )
}

