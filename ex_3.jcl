//CNG9    JOB 1                                         
//STEP001 EXEC PGM=IDCAMS                               
//SYSPRINT DD   SYSOUT=*                                
//SYSOUT   DD   SYSOUT=*                                
//SYSIN    DD   *                                       
   LISTCAT ENTRIES(Z61696.DBB99) -                      
           NONVSAM                                      
/*                                                      
//         IF (STEP001.RC LT 04) THEN                   
//STEP002  EXEC PGM=IDCAMS                              
//SYSPRINT DD   SYSOUT=*                                
//SYSOUT   DD   SYSOUT=*                                
//WARNING  DD   *                                       
 !!! BACKUP FILE WITH THE SAME NAME EXISTS !!!      
/*                                                      
//SYSIN    DD   *                                       
  PRINT INFILE(WARNING) CHARACTER OUTFILE(SYSOUT)       
   SET MAXCC=4                                          
/*                                                      
//         ENDIF                                        
//STEP01  EXEC PGM=ICETOOL                              
//TOOLMSG DD SYSOUT=*                                   
//DFSMSG  DD SYSOUT=*                                   
//INPUT   DD DSN=&SYSUID..DBB99,DISP=SHR                
//OUTPUT  DD DSN=&SYSUID..OUTP,                         
//           DISP=(NEW,CATLG,DELETE),                   
//           LIKE=&SYSUID..DBB99                        
//TOOLIN  DD *                                          
    COPY FROM(INPUT) TO(OUTPUT) USING(CTL1)             
/*                                                      
//CTL1CNTL DD *                                         
  INREC IFTHEN=(WHEN=(32,9,CH,EQ,C'DETECTIVE'),         
           OVERLAY=(32:C'OFFICER  '))                   
/*                                                      