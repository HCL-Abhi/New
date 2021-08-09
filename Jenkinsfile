@Library('piper-library-os')_ 
node () 
{
 stage('prepare') 

      checkout scm

      setupCommonPipelineEnvironment script:this,
  
  stage('RunUnitTest') 
    gctsExecuteABAPUnitTests(
      script: this,
      host: 'https://hcluks4hana.hcldigilabs.com:8001',
      client: '200',
      abapCredentialsId: 'AbapSystem',
      repository: 'HCL-DevOps-V1'
)


    
    stage("Rollback")
    {
	 if (currentBuild.result == 'FAILURE') {
    gctsRollback(
        script: this,
        host: "https://hcluks4hana.hcldigilabs.com:8001/",
        client: "200",
        abapCredentialsId: 'AbapSystem',
        repository: "HCL-DevOps-V1"
   )
		 println "Hello Jenkins"
}
	}
  
 
  
   stage('CreateRepository')
  gctsCreateRepository(
  script: this,
  host: 'https://hclutl1909.hcldigilabs.com:8001',
  client: '200',
  abapCredentialsId: 'ABAPUserPasswordCredentialsId',
  repository: 'HCL-DevOps-V1',
  remoteRepositoryURL: 'https://github.com/abhilashhaa/OpenSAPDemo.git',
  role: 'TARGET',
  vSID: 'FEF'
  )
  
  
  stage('CloneRepository')
  
  gctsCloneRepository(
  script: this,
  host: 'https://hclutl1909.hcldigilabs.com:8001',
  client: '200',
  abapCredentialsId: 'ABAPUserPasswordCredentialsId',
  repository: 'HCL-DevOps-V1'
)
  
  
    stage('DeployCommit') 
    gctsDeploy(
  script: this,
  host: 'https://hclutl1909.hcldigilabs.com:8001',
  abapCredentialsId: 'ABAPUserPasswordCredentialsId',
  repository: 'HCL-DevOps-V1',
  remoteRepositoryURL: "https://github.com/abhilashhaa/OpenSAPDemo.git",
  role: 'TARGET',
  vSID: 'FEF',
  rollback: 'false',
 
  
)  
  
      
      
      
  
  
}
