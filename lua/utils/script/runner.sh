#!/bin/bash

# Runner.

# Un sinple script que ejecuta un archivo con su repectivo entorno de jeccucion
# y muestra el resultado de la ejecución. El archivo debe ser pasado
# como parámetro justo con opcionales opciones de
# ejecución.

# autor: @nefasque

source ~/.config/nvim/lua/utils/script/separadores.sh

# recibir parametros
FILE=$1
OPCIONES=$@
unset OPCIONES[0]

# comprobamos que el archivo exista
if [ ! -f "$FILE" ]; then
  echo "No existe el archivo '$FILE'"
  exit 1
fi

# comprobar que el archivo tenga permisos de lectura
if [ ! -r "$FILE" ]; then
  echo "No tiene permisos de lectura para el archivo '$FILE'"
  exit 1
fi

# comprobar que el archivo no sea de sistema
if [ -h "$FILE" ]; then
  echo "El archivo '$FILE' es un enlace simbólico"
  exit 1
fi


# obtener la extensión
ext="${FILE##*.}"

# comprotipo de archivo.
if [[ $ext == "js" ]]; then
  cmd="node $OPCIONES $FILE"
elif [[ $ext == "py" ]]; then
  cmd="python $OPCIONES $FILE"
elif [[ $ext == "c" ]]; then
  cmd="gcc $OPCIONES $FILE && ./a.out"
elif [[ $ext == "sh" ]]; then
  cmd="bash $OPCIONES $FILE"
elif [[ $ext == "pl" ]]; then
  cmd="perl $OPCIONES $FILE"
elif [[ $ext == "rb" ]]; then
  cmd="ruby $OPCIONES $FILE"
elif [[ $ext == "php" ]]; then
  cmd="php $OPCIONES $FILE"
elif [[ $ext == "go" ]]; then
  cmd="go run $OPCIONES $FILE"
elif [[ $ext == "rs" ]]; then
  cmd="rustc $OPCIONES $FILE && ./a.out"
elif [[ $ext == "java" ]]; then
  cmd="javac $OPCIONES $FILE && java a.out"
elif [[ $ext == "swift" ]]; then
  cmd="swift $OPCIONES $FILE"
elif [[ $ext == "dart" ]]; then
  cmd="dart $OPCIONES $FILE"
elif [[ $ext == "kt" ]]; then
  cmd="kotlinc $OPCIONES $FILE && ./a.out"
elif [[ $ext == "cs" ]]; then
  cmd="dotnet run"
elif [[ $ext == "ts" ]]; then
  cmd="tsc $OPCIONES $FILE"
elif [[ $ext == "cpp" ]]; then
  cmd="g++ $OPCIONES $FILE && ./a.out"
elif [[ $ext == "csproj" ]]; then
  cmd="dotnet run"
elif [[ $ext == "csx" ]]; then
  cmd="dotnet run"
else
  cmd="$FILE"
fi

clear
separadoresEncabezado "$cmd"
eval "$cmd"
separadores
read -p "inter any key to exit" a
exit
