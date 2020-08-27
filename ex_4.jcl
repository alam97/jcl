//******************************************************     
//*** THIS JOB PARSES DATA INTO A DATASET                    
//*** AND MULTIPLIES THE ID BY 2                             
//******************************************************     
//STEP010 EXEC PGM=SORT                                      
//SYSOUT  DD SYSOUT=*                                        
//SYSPRINT DD SYSOUT=A                                       
//SORTIN  DD *                                               
WAYNE,M,1234                                                 
SUMMERS,F,7533                                               
KENT,M,7636                                                  
PRINCE,F,5544                                                
/*                                                           
//SORTOUT DD DSN=###################,DISP=SHR            
//SYSIN   DD *                                               
   OPTION COPY                                               
  OUTREC PARSE=(%01=(ENDBEFR=C',',FIXLEN=10),                
                 %02=(ENDBEFR=C',',FIXLEN=1),                
                 %03=(FIXLEN=4)),                            
      BUILD=(%01,14:%02,                                     
             20:%03)                                         
/*                                                           
//STEP010 EXEC PGM=SORT                                      
//SYSOUT  DD SYSOUT=*                                        
//SYSPRINT DD SYSOUT=A                                       
//SORTIN  DD DSN=###################,DISP=SHR            
//SORTOUT DD DSN=###################,DISP=SHR            
//SYSIN   DD *                                               
   OPTION COPY                                               
   OUTREC FIELDS=(1,19,20,4,ZD,MUL,+2)                       
/*                                                           