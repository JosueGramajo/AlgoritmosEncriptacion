#!/usr/bin/env bash

cd ..

SRC='src/generated/java'
BIN='src/generated/bin'

if [ ! -d $BIN ]; then
  mkdir -p $BIN;
fi

wsimport -s $SRC -d $BIN -p ws http://www.banguat.gob.gt/variables/ws/TipoCambio.asmx?WSDL



#wsimport -s 'src/generated/src' -d 'src/generated/bin' -p banguat http://www.banguat.gob.gt/variables/ws/TipoCambio.asmx?WSDL
#wsimport -keep -p ws http://www.banguat.gob.gt/variables/ws/TipoCambio.asmx?WSDL