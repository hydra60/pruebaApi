#!/bin/bash
# En este script vamos a realizar operaciones aritméticas usando los comandos let y expr.
varX=2
varY=3
varZ=0

# Operaciones con el comando let:
echo "Operaciones con el comando let:$varX $varY $varZ"
echo "suma $varX $varY"
let suma=$varX+$varY
echo $suma 

echo "resta $varX $varY"
let resta=$varX-$varY
echo $resta

echo "multiplcacion $varX $varY"
let multiplicacion=$varX*$varY
echo $multiplicacion

echo "division $varY $varY"
let division=$varY/$varY # Si la division es algo dividido por 0 dará error y lo mostrará por STDERR.
echo $division

echo "resto $varY $varX"
let resto=$varY%$varY
echo $resto

if [ 2 -gt 1 ]; then #>
    echo "2 es mayor que 1"
fi
if [ 2 -ge 2 ]; then #>=
    echo "2 es mayor o igual que 2"
fi
if [ 2 -eq 2 ]; then #==
    echo "2 es igual que 2"
fi
if [ 2 -lt 4 ]; then #<
    echo "2 es menor que 4"
fi
if [ 4 -le 4 ]; then #=<
    echo "4 es menor o igual que 4"
fi


NUM=0
while [ $NUM -le 10 ]; do
    echo "\$NUM: $NUM"
    let NUM=$NUM+1
done

