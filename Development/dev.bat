@echo off
echo compiling
java -jar jflex-1.6.0.jar NanoMorphoLexer.jflex
byacc -Jclass=NanoMorphoParser NanoMorpho.byaccj
javac NanoMorphoLexer.java NanoMorphoParser.java NanoMorphoParserVal.java
move *.class ../Production
del *.java
pause