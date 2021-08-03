@library ('piper-library-os')



node() {

  stage('Start') {
    
       }
 stage('Deploy Commit') {
	 
      gctsDeploy script: this
  }
  stage('Roll Unit Test') {
	  
       gctsExecuteABAPUnitTests script: this
  }
  stage('RollBack Commit') {
	  
    gctsRollback script: this
  }
      
	
  
}

