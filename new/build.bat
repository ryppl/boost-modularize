::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Copyright (C) 2011 Daniel Pfeifer <daniel@pfeifer-mail.de>           ::
::                                                                      ::
:: Distributed under the Boost Software License, Version 1.0.           ::
:: See accompanying file LICENSE_1_0.txt or copy at                     ::
::   http://www.boost.org/LICENSE_1_0.txt                               ::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

@ECHO OFF
SETLOCAL ENABLEDELAYEDEXPANSION
SET OPTIONS=
SET LASTOPT=
SET CURRENT=
FOR %%A IN (%*) DO (CALL :PARSE %%A)
CALL cmake %OPTIONS% -P build.cmake
ENDLOCAL
GOTO:EOF

:PARSE
SET CURRENT=%~1
IF "%CURRENT:~0,2%"=="--" GOTO:HANDLE_NAME
IF "%LASTOPT%"=="" GOTO:HANDLE_COMMAND
GOTO:HANDLE_VALUE

:HANDLE_NAME
IF NOT "%LASTOPT%"=="" SET OPTIONS=%OPTIONS% -D%LASTOPT%=TRUE
SET LASTOPT=%CURRENT:~2%
CALL :TOUPPER LASTOPT
GOTO:EOF

:HANDLE_VALUE
SET OPTIONS=%OPTIONS% -D%LASTOPT%="%CURRENT%"
SET LASTOPT=
GOTO:EOF

:TOUPPER
SET %~1=!%1:a=A!
SET %~1=!%1:b=B!
SET %~1=!%1:c=C!
SET %~1=!%1:d=D!
SET %~1=!%1:e=E!
SET %~1=!%1:f=F!
SET %~1=!%1:g=G!
SET %~1=!%1:h=H!
SET %~1=!%1:i=I!
SET %~1=!%1:j=J!
SET %~1=!%1:k=K!
SET %~1=!%1:l=L!
SET %~1=!%1:m=M!
SET %~1=!%1:n=N!
SET %~1=!%1:o=O!
SET %~1=!%1:p=P!
SET %~1=!%1:q=Q!
SET %~1=!%1:r=R!
SET %~1=!%1:s=S!
SET %~1=!%1:t=T!
SET %~1=!%1:u=U!
SET %~1=!%1:v=V!
SET %~1=!%1:w=W!
SET %~1=!%1:x=X!
SET %~1=!%1:y=Y!
SET %~1=!%1:z=Z!
GOTO:EOF
