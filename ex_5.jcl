//TSTPR2   JOB  1                                          
//**************************************************       
//*           PROC TO CREATE A DATASET             *       
//**************************************************       
//TSTPROC  PROC                                            
//STEP010  EXEC PGM=IEFBR14                                
//SYSPRINT DD SYSOUT=*                                     
//SYSOUT   DD SYSOUT=*                                     
//SYSDUMP  DD SYSOUT=*                                     
//DD1      DD DSN=&DATASET,                                
//         DISP=(NEW,CATLG,DELETE),                        
//         UNIT=SYSALLDA,SPACE=(TRK,1)                     
// PEND                                                    
//**************************************************       
//*            CALLING THE PROCEDURE               *       
//**************************************************       
//TST01    EXEC TSTPROC,DATASET=########                
//STEPO20  EXEC PGM=IEFBR14                                
//SYSPRINT DD SYSOUT=*                                     
//SYSOUT   DD SYSOUT=*                                     
//SYSDUMP  DD SYSOUT=*                                     
//***************************************************      
//*            FILLING THE DATASET                  *      
//***************************************************      
//STEP030 EXEC PGM=SORT                                    
//SYSOUT  DD SYSOUT=*                                  
//SYSPRINT DD SYSOUT=A                                 
//SORTIN  DD *                                         
MORKE,M,1234                                           
PARKERS,F,7533                                         
ALET,M,7636                                            
POPPIS,F,5544                                          
/*                                                     
//SORTOUT DD DSN=########,DISP=SHR                  
//SYSIN   DD *                                         
   OPTION COPY
 OUTREC PARSE=(%01=(ENDBEFR=C',',FIXLEN=10),   
               %02=(ENDBEFR=C',',FIXLEN=1), 
               %03=(FIXLEN=4)),             
      BUILD=(%01,14:%02,                      
             20:%03)                          
/*                     