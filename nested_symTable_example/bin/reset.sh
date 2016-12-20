#!/bin/bash

rm *.class
cd ../
javac -d ./bin TestCymbol.java
cd bin
java TestCymbol
