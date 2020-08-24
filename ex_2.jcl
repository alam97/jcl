//ZAD1     JOB 1
//*--------------------------------------
//STEP010  EXEC PGM=IDCAMS
//SYSPRINT DD SYSOUT=*
//SYSIN    DD *
    DELETE &SYSUID..TEST
    IF MAXCC = 8 THEN SET MAXCC = 0
/*
//*************************************************
//STEP020 EXEC PGM=SORT 
//SYSOUT  DD SYSOUT=*
//SORTIN  DD DSN=&SYSUID..FIL.ABC,DISP=SHR  
//SORTOUT DD DSN=&SYSUID..TEST.OUTPUT,            
//            SPACE=(CYL,(1,1),RLSE),DCB=*.SORTIN,
//            DISP=(NEW,CATLG,DELETE)              
//SYSIN   DD *                                     
    SORT FIELDS=(1,8,CH,A)                           
/*   
//*************************************************                                              
//SYSOUT  DD SYSOUT=*                              
//STEP030 EXEC PGM=SORT
//SYSOUT  DD SYSOUT=*   
//SORTIN  DD DSN=&SYSUID..FIL.XYZ,DISP=SHR  
//SORTOUT DD DSN=&SYSUID..TEST.OUTPUT2,            
//            SPACE=(CYL,(1,1),RLSE),DCB=*.SORTIN,
//            DISP=(NEW,CATLG,DELETE)              
//SYSIN   DD *                                     
    SORT FIELDS=(1,8,CH,D)                           
/*                
//*************************************************                                
//STEP040  EXEC PGM=SORT                               
//SYSOUT  DD SYSOUT=*                                 
//IN1     DD DSN=&SYSUID..TEST.OUTPUT2,DISP=SHR    
//IN2     DD DSN=&SYSUID..TEST.OUTPUT,DISP=SHR    
//SORTOUT DD DSN=&SYSUID..TEST.OUTPUT3,            
//            SPACE=(CYL,(1,1),RLSE),DCB=*.SORTIN,
//            DISP=(NEW,CATLG,DELETE)                  
//SYSIN   DD *                                        
     JOINKEYS F1=IN1,FIELDS=(1,8,A)             
     JOINKEYS F2=IN2,FIELDS=(11,8,A)            
     REFORMAT FIELDS=(F1:1,8,F2:1,8,F1:10,28)   
     OPTION COPY                                
     OUTREC FIELDS=(1,8,2X,9,8,12X,18,18)                                          
/*  
//*************************************************                                                                   
//STEP050  EXEC PGM=ICETOOL                         
//TOOLMSG DD SYSOUT=*                              
//DFSMSG  DD SYSOUT=*                              
//INDD    DD DSN=&SYSUID..TEST.OUTPUT2,DISP=SHR 
//OUTDD1  DD DSN=&SYSUID..TEST.GHI,            
//            SPACE=(CYL,(1,1),RLSE),DCB=*.SORTIN,
//            DISP=(NEW,CATLG,DELETE)               
//OUTDD1  DD DSN=&SYSUID..TEST.JKL,            
//            SPACE=(CYL,(1,1),RLSE),DCB=*.SORTIN,
//            DISP=(NEW,CATLG,DELETE)                 
//TOOLIN  DD *                                     
  COPY FROM(INDD) TO(OUTDD1) USING(CTL1)           
  COPY FROM(INDD) TO(OUTDD2) USING(CTL2)           
/*                                                 
//CTL1CNTL DD *                                    
 INCLUDE COND=(1,8,CH,LE,C'40000000')              
/*                                                 
//CTL2CNTL DD *                                    
 INCLUDE COND=(1,8,CH,GT,C'40000000')              
/*  
//************************************************                                               
//STEP060  EXEC PGM=SORT                                
//SYSPRINT DD SYSOUT=A                                 
//SORTIN  DD DSN=&SYSUID..TEST.JKL,DISP=SHR      
//OUTDD1  DD DSN=&SYSUID..TEST.OUTPUT4,            
//            SPACE=(CYL,(1,1),RLSE),DCB=*.SORTIN,
//            DISP=(NEW,CATLG,DELETE)                    
//SYSOUT  DD SYSOUT=*                                  
//SYSIN   DD *                                         
     SORT FIELDS=COPY                                  
     OUTFIL REMOVECC,                                  
     HEADER1=(1:'A. L.'),                       
     TRAILER1=(1:'INTRO TO JCL')                      
/*                                                                             