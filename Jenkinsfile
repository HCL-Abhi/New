@Library('piper-library-os') _




   
    


node()
{
stage('Prepare')
	
stage('Build')
	
	 stage('CheckLog') {
      steps {
        if (manager.logContains('.*myTestString.*'))    
		echo "Hello Jenkins"
        }
      }
	 
	
	
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
   def ret = gctsExecuteABAPUnitTests(
      script: this,
      host: 'https://hclutl1909.hcldigilabs.com:8001',
      client: '200',
      abapCredentialsId: 'ABAPUserPasswordCredentialsId',
      repository: 'HCL-DevOps-V'
)

echo ret+ "return value"
    
    stage("Rollback")
	{
	 if (RunUnitTest.result == 'SUCCESS') {
    gctsRollback(
        script: this,
        host: "https://hclutl1909.hcldigilabs.com:8001",
        client: "200",
        abapCredentialsId: 'ABAPUserPasswordCredentialsId',
        repository: "HCL-DevOps-V"
   )
		  
}
		
	}
		
	
	stage('CleanUp') 
   

}


