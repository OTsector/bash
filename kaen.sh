#!/bin/bash

if [ $# -lt 2 ] || [ ! -f $1 ]; then
	echo "use :"$0" [input] [output]"
	exit 1
fi

cat $1|sed 's/ა/a/g'|sed 's/ბ/b/g'|sed 's/გ/g/g'|sed 's/დ/d/g'|sed 's/ე/e/g' \
	|sed 's/ვ/v/g'|sed 's/ზ/z/g'|sed 's/თ/t/g'|sed 's/ი/i/g'|sed 's/კ/k/g' \
	|sed 's/ლ/l/g'|sed 's/მ/m/g'|sed 's/ნ/n/g'|sed 's/ო/o/g'|sed 's/პ/p/g' \
	|sed 's/ჟ/zh/g'|sed 's/რ/r/g'|sed 's/ს/s/g'|sed 's/ტ/t/g'|sed 's/უ/u/g' \
	|sed 's/ფ/f/g'|sed 's/ქ/q/g'|sed 's/ღ/gh/g'|sed 's/ყ/k/g'|sed 's/შ/sh/g' \
	|sed 's/ჩ/ch/g'|sed 's/ც/c/g'|sed 's/ძ/dz/g'|sed 's/წ/ts/g'|sed 's/ჭ/tch/g' \
	|sed 's/ხ/kh/g'|sed 's/ჯ/j/g'|sed 's/ჰ/h/g' > $2

cat $1|sed 's/ა/a/g'|sed 's/ბ/b/g'|sed 's/გ/g/g'|sed 's/დ/d/g'|sed 's/ე/e/g' \
	|sed 's/ვ/v/g'|sed 's/ზ/z/g'|sed 's/თ/t/g'|sed 's/ი/i/g'|sed 's/კ/k/g' \
	|sed 's/ლ/l/g'|sed 's/მ/m/g'|sed 's/ნ/n/g'|sed 's/ო/o/g'|sed 's/პ/p/g' \
	|sed 's/ჟ/j/g'|sed 's/რ/r/g'|sed 's/ს/s/g'|sed 's/ტ/t/g'|sed 's/უ/u/g' \
	|sed 's/ფ/f/g'|sed 's/ქ/q/g'|sed 's/ღ/g/g'|sed 's/ყ/y/g'|sed 's/შ/sh/g' \
	|sed 's/ჩ/ch/g'|sed 's/ც/c/g'|sed 's/ძ/dz/g'|sed 's/წ/w/g'|sed 's/ჭ/tch/g' \
	|sed 's/ხ/x/g'|sed 's/ჯ/j/g'|sed 's/ჰ/h/g' >> $2

sort $2|uniq > $2".bak"; mv $2".bak" $2

