@echo OFF
cd..
IF "%~1"=="" GOTO install
IF "%~1"=="build" GOTO build
IF "%~1"=="install" GOTO install
IF "%~1"=="submit" GOTO submit


:build
	echo Building HaxeUI haxelib

	del bin\haxeui.zip
	scripts\7za a bin\haxeui.zip haxelib.json include.xml assets haxe
GOTO end

:install
	echo Installing HaxeUI haxelib

	del bin\haxeui.zip
	scripts\7za a bin\haxeui.zip haxelib.json include.xml assets haxe

	haxelib local bin\haxeui.zip
GOTO end

:submit
	echo Submitting HaxeUI haxelib

	del bin\haxeui.zip
	scripts\7za a bin\haxeui.zip haxelib.json include.xml assets haxe

	haxelib local bin\haxeui.zip
	
	haxelib submit bin\haxeui.zip
GOTO end


:end
echo Complete