#!/bin/bash
# separadores.sh

# comprueba si un numero es par
function esPar {
  num=$1
  if [ $((num % 2)) -eq 0 ]; then
    return 0
  else
    return 1
  fi
}

# imprime un encabezado
function separadoresEncabezado {
  encabezado=$1
  cols=$(tput cols)
  cols2=$(((${cols} - (${#encabezado}) - 2 ) / 2))

  for ((i = 0; i < ${cols2}; i++)); do
    printf "-"
  done

  printf " ${encabezado} "

  for ((i = 0; i < (${cols2}); i++)); do
    printf "-"
  done

  # if esPar ${#encabezado}; then
  #   printf "-"
  # fi
  #
  echo
}

# imprime un separador
function separadores {
  cols=$(tput cols)
  for ((i = 0; i < ${cols}; i++)); do
    printf "-"
  done
}
