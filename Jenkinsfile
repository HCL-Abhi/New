@Library('piper-library-os')_ 

node () 
   {
  
  
  stage('DeployCommit') 
    gctsDeploy(
       script: this,
       host: 'https://hclutl1909.hcldigilabs.com:8001'
       client: '000',
       abapCredentialsId: 'ABAPUserPasswordCredentialsId'
       repository: 'OpenSAP'
       remoteRepositoryURL: 'https://github.com/abhilashhaa/OpenSAPDemo.git'
       role: 'Provided'
       vSID: 'FEF'
       branch: 'master'
       commit: 'commit'
       scope: 'scope'
       rollback: false
       configuration:
       dummyconfig: "dummyval"
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

