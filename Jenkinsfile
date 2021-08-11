@Library('piper-library-os') _



node()
{
stage('Prepare')
	
stage('Build')
	
	
	 stage('DeployCommit') 
    gctsDeploy(
  script: this,
  host: 'https://hclutl1909.hcldigilabs.com:8001',
  abapCredentialsId: 'ABAPUserPasswordCredentialsId',
  repository: 'HCL-DevOps-V',
  remoteRepositoryURL: "https://github.com/abhilashhaa/HCL-DevOps-V1.git",
  role: 'TARGET',
  vSID: 'FEF',
  rollback: 'false'
	    )
	      
stage('RunUnitTest') 
    gctsExecuteABAPUnitTests(
      script: this,
      host: 'https://hclutl1909.hcldigilabs.com:8001',
      client: '200',
      abapCredentialsId: 'ABAPUserPasswordCredentialsId',
      repository: 'HCL-DevOps-V'
)


    
    stage("Rollback")
	{
	 if (currentBuild.result == 'SUCCESS') {
    gctsRollback(
        script: this,
        host: "https://hclutl1909.hcldigilabs.com:8001",
        client: "200",
        abapCredentialsId: 'ABAPUserPasswordCredentialsId',
        repository: "HCL-DevOps-V"
   )
		  println "Hello Jenkins"
}
	}
		
	
	stage('CleanUp') 
   

}
