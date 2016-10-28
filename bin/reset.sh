#!/bin/bash

rm *.class
cd ../
javac TestCymbol.java -d ./bin
cd bin
java TestCymbol
