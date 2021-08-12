@Library('piper-library-os') _

node()
{
stage('Prepare')	
	

	
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

	
       stage('someStage') {
            catchError {
            build job: 'system-check-flow'
        
        echo currentBuild.result+"Testing1234"
    }
}
  
	

}


