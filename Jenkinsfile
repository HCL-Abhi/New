@Library('piper-library-os') _


node()
{
stage('Prepare')	
	checkout scm
stage('build')
	checkout scm
    
	
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
	 { 
  try { 
	  gctsExecuteABAPUnitTests(
      script: this,
      host: 'https://hclutl1909.hcldigilabs.com:8001',
      client: '200',
      abapCredentialsId: 'ABAPUserPasswordCredentialsId',
      repository: 'HCL-DevOps-V'
	  )
	 currentBuild.result = 'SUCCESS'
 	  } 
	catch (Exception err) { currentBuild.result = 'FAILURE'
	     } 
echo "RESULT: ${currentBuild.result}"
		 
		 }
	
   stage("Rollback")
	{
	if (currentBuild.result == 'FAILURE')
		{
	steps:
	    script {
	       gctsRollback(
        script: this,
        host: "https://hclutl1909.hcldigilabs.com:8001",
        client: "200",
        abapCredentialsId: 'ABAPUserPasswordCredentialsId',
        repository: "HCL-DevOps-V"
   )
		    mail to: 'abhilasha-singh@hcl.com',
             subject: "Failed Pipeline: ${currentBuild.fullDisplayName}",
             body: "Something is wrong with ${env.BUILD_URL}"
		    
	    }
		}
	       
	}
	

	
                     
        
  
	

}


