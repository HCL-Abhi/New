@Library('piper-library-os')_ 

node () 
{
 
  
  stage('RunUnitTest') 
    gctsExecuteABAPUnitTests(
      
     )
      stage('RollbackCommit') 
    gctsRollback(
     
  )
     
  
   stage('CreateRepository')
  gctsCreateRepository(
  
  )
  
  
  stage('CloneRepository')
  gctsCloneRepository(
  
)
  
  
    stage('DeployCommit') 
    gctsDeploy(
 
)  
     
  
}

