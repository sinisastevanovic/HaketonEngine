@echo off
pushd %~dp0\..\
call thirdparty\bin\premake5.exe vs2019
pushd HaketonEngine\SandboxProject
popd
popd
PAUSE