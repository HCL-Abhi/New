@Library('piper-library-os')_ 

node () 
{
  
    stage('DeployCommit') 
    gctsDeploy(
  script: this,
  host: 'https://abap.server.com:port',
  client: '000',
  abapCredentialsId: 'ABAPUserPasswordCredentialsId',
  repository: 'myrepo',
  remoteRepositoryURL: "https://remote.repository.url.com",
  role: 'SOURCE',
  vSID: 'ABC',
  branch: 'branch',
  commit: 'commit',
  scope: 'scope',
  rollback: false,
  configuration: [dummyConfig: 'dummyval']
)
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

