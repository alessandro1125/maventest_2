@REM ----------------------------------------------------------------------------
@REM  Copyright 2001-2006 The Apache Software Foundation.
@REM
@REM  Licensed under the Apache License, Version 2.0 (the "License");
@REM  you may not use this file except in compliance with the License.
@REM  You may obtain a copy of the License at
@REM
@REM       http://www.apache.org/licenses/LICENSE-2.0
@REM
@REM  Unless required by applicable law or agreed to in writing, software
@REM  distributed under the License is distributed on an "AS IS" BASIS,
@REM  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
@REM  See the License for the specific language governing permissions and
@REM  limitations under the License.
@REM ----------------------------------------------------------------------------
@REM
@REM   Copyright (c) 2001-2006 The Apache Software Foundation.  All rights
@REM   reserved.

@echo off

set ERROR_CODE=0

:init
@REM Decide how to startup depending on the version of windows

@REM -- Win98ME
if NOT "%OS%"=="Windows_NT" goto Win9xArg

@REM set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" @setlocal

@REM -- 4NT shell
if "%eval[2+2]" == "4" goto 4NTArgs

@REM -- Regular WinNT shell
set CMD_LINE_ARGS=%*
goto WinNTGetScriptDir

@REM The 4NT Shell from jp software
:4NTArgs
set CMD_LINE_ARGS=%$
goto WinNTGetScriptDir

:Win9xArg
@REM Slurp the command line arguments.  This loop allows for an unlimited number
@REM of arguments (up to the command line limit, anyway).
set CMD_LINE_ARGS=
:Win9xApp
if %1a==a goto Win9xGetScriptDir
set CMD_LINE_ARGS=%CMD_LINE_ARGS% %1
shift
goto Win9xApp

:Win9xGetScriptDir
set SAVEDIR=%CD%
%0\
cd %0\..\.. 
set BASEDIR=%CD%
cd %SAVEDIR%
set SAVE_DIR=
goto repoSetup

:WinNTGetScriptDir
set BASEDIR=%~dp0\..

:repoSetup
set REPO=


if "%JAVACMD%"=="" set JAVACMD=java

if "%REPO%"=="" set REPO=%BASEDIR%\repo

set CLASSPATH="%BASEDIR%"\etc;"%REPO%"\org\apache\tomcat\embed\tomcat-embed-core\8.5.23\tomcat-embed-core-8.5.23.jar;"%REPO%"\org\apache\tomcat\tomcat-annotations-api\8.5.23\tomcat-annotations-api-8.5.23.jar;"%REPO%"\org\apache\tomcat\embed\tomcat-embed-jasper\8.5.23\tomcat-embed-jasper-8.5.23.jar;"%REPO%"\org\apache\tomcat\embed\tomcat-embed-el\8.5.23\tomcat-embed-el-8.5.23.jar;"%REPO%"\org\eclipse\jdt\ecj\3.12.3\ecj-3.12.3.jar;"%REPO%"\org\apache\tomcat\tomcat-jasper\8.5.23\tomcat-jasper-8.5.23.jar;"%REPO%"\org\apache\tomcat\tomcat-servlet-api\8.5.23\tomcat-servlet-api-8.5.23.jar;"%REPO%"\org\apache\tomcat\tomcat-juli\8.5.23\tomcat-juli-8.5.23.jar;"%REPO%"\org\apache\tomcat\tomcat-el-api\8.5.23\tomcat-el-api-8.5.23.jar;"%REPO%"\org\apache\tomcat\tomcat-api\8.5.23\tomcat-api-8.5.23.jar;"%REPO%"\org\apache\tomcat\tomcat-util-scan\8.5.23\tomcat-util-scan-8.5.23.jar;"%REPO%"\org\apache\tomcat\tomcat-util\8.5.23\tomcat-util-8.5.23.jar;"%REPO%"\org\apache\tomcat\tomcat-jasper-el\8.5.23\tomcat-jasper-el-8.5.23.jar;"%REPO%"\org\apache\tomcat\tomcat-jsp-api\8.5.23\tomcat-jsp-api-8.5.23.jar;"%REPO%"\org\json\org.json\chargebee-1.0\org.json-chargebee-1.0.jar;"%REPO%"\com\assetx\assetx-utils\1.0\assetx-utils-1.0.jar;"%REPO%"\com\google\api\client\google-api-client\1.2.3-alpha\google-api-client-1.2.3-alpha.jar;"%REPO%"\org\codehaus\jackson\jackson-core-asl\1.5.7\jackson-core-asl-1.5.7.jar;"%REPO%"\xpp3\xpp3\1.1.4c\xpp3-1.1.4c.jar;"%REPO%"\org\apache\httpcomponents\httpclient\4.0.1\httpclient-4.0.1.jar;"%REPO%"\org\apache\httpcomponents\httpcore\4.0.1\httpcore-4.0.1.jar;"%REPO%"\commons-logging\commons-logging\1.1.1\commons-logging-1.1.1.jar;"%REPO%"\commons-codec\commons-codec\1.3\commons-codec-1.3.jar;"%REPO%"\com\google\api\client\google-api-client-auth-oauth\1.0.8-alpha\google-api-client-auth-oauth-1.0.8-alpha.jar;"%REPO%"\com\google\api\client\google-api-client-auth\1.0.8-alpha\google-api-client-auth-1.0.8-alpha.jar;"%REPO%"\com\google\api\client\google-api-client-escape\1.0.8-alpha\google-api-client-escape-1.0.8-alpha.jar;"%REPO%"\com\google\api\client\google-api-client-http\1.0.8-alpha\google-api-client-http-1.0.8-alpha.jar;"%REPO%"\com\google\api\client\google-api-client-util\1.0.8-alpha\google-api-client-util-1.0.8-alpha.jar;"%REPO%"\com\google\api\client\google-api-client-googleapis\1.2.2-alpha\google-api-client-googleapis-1.2.2-alpha.jar;"%REPO%"\com\google\api\client\google-api-client-googleapis-auth-storage\1.0.8-alpha\google-api-client-googleapis-auth-storage-1.0.8-alpha.jar;"%REPO%"\com\google\api\client\google-api-client-googleapis-auth-oauth\1.0.8-alpha\google-api-client-googleapis-auth-oauth-1.0.8-alpha.jar;"%REPO%"\com\google\api\client\google-api-client-googleapis-extensions-android2\1.4.0-alpha\google-api-client-googleapis-extensions-android2-1.4.0-alpha.jar;"%REPO%"\com\google\android\android\2.1.2\android-2.1.2.jar;"%REPO%"\org\khronos\opengl-api\gl1.1-android-2.1_r1\opengl-api-gl1.1-android-2.1_r1.jar;"%REPO%"\xerces\xmlParserAPIs\2.6.2\xmlParserAPIs-2.6.2.jar;"%REPO%"\org\json\json\20080701\json-20080701.jar;"%REPO%"\com\google\guava\guava\r09\guava-r09.jar;"%REPO%"\com\google\api\client\google-api-client-googleapis-auth-authsub\1.0.8-alpha\google-api-client-googleapis-auth-authsub-1.0.8-alpha.jar;"%REPO%"\com\google\api\client\google-api-client-googleapis-auth\1.0.8-alpha\google-api-client-googleapis-auth-1.0.8-alpha.jar;"%REPO%"\com\google\api\client\google-api-client-googleapis-auth-clientlogin\1.0.8-alpha\google-api-client-googleapis-auth-clientlogin-1.0.8-alpha.jar;"%REPO%"\com\google\api\client\google-api-client-auth-oauth2\1.0.8-alpha\google-api-client-auth-oauth2-1.0.8-alpha.jar;"%REPO%"\com\google\api\client\google-api-client-json\1.0.8-alpha\google-api-client-json-1.0.8-alpha.jar;"%REPO%"\com\web\assetx\web-app\1.0-SNAPSHOT\web-app-1.0-SNAPSHOT.jar

set ENDORSED_DIR=
if NOT "%ENDORSED_DIR%" == "" set CLASSPATH="%BASEDIR%"\%ENDORSED_DIR%\*;%CLASSPATH%

if NOT "%CLASSPATH_PREFIX%" == "" set CLASSPATH=%CLASSPATH_PREFIX%;%CLASSPATH%

@REM Reaching here means variables are defined and arguments have been captured
:endInit

%JAVACMD% %JAVA_OPTS%  -classpath %CLASSPATH% -Dapp.name="webapp" -Dapp.repo="%REPO%" -Dapp.home="%BASEDIR%" -Dbasedir="%BASEDIR%" launch.Main %CMD_LINE_ARGS%
if %ERRORLEVEL% NEQ 0 goto error
goto end

:error
if "%OS%"=="Windows_NT" @endlocal
set ERROR_CODE=%ERRORLEVEL%

:end
@REM set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" goto endNT

@REM For old DOS remove the set variables from ENV - we assume they were not set
@REM before we started - at least we don't leave any baggage around
set CMD_LINE_ARGS=
goto postExec

:endNT
@REM If error code is set to 1 then the endlocal was done already in :error.
if %ERROR_CODE% EQU 0 @endlocal


:postExec

if "%FORCE_EXIT_ON_ERROR%" == "on" (
  if %ERROR_CODE% NEQ 0 exit %ERROR_CODE%
)

exit /B %ERROR_CODE%
