@echo off
title This is your first batch script!
set TEST=%1
echo compiling
java NanoMorphoParser %TEST%.nm > %TEST%.masm
java -jar morpho.jar -c %TEST%.masm
echo Running program %TEST%
java -jar morpho.jar %TEST%
del *.mexe
del *.masm
pause