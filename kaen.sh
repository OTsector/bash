#!/bin/bash

if [ $# -lt 2 ] || [ ! -f $1 ]; then
	echo "use :"$0" [input] [output]"
	exit 1
fi

cat $1|sed 's/ა/a/g;s/ბ/b/g;s/გ/g/g;s/დ/d/g;s/ე/e/g' \
	|sed 's/ვ/v/g;s/ზ/z/g;s/თ/t/g;s/ი/i/g;s/კ/k/g' \
	|sed 's/ლ/l/g;s/მ/m/g;s/ნ/n/g;s/ო/o/g;s/პ/p/g' \
	|sed 's/ჟ/zh/g;s/რ/r/g;s/ს/s/g;s/ტ/t/g;s/უ/u/g' \
	|sed 's/ფ/f/g;s/ქ/q/g;s/ღ/gh/g;s/ყ/k/g;s/შ/sh/g' \
	|sed 's/ჩ/ch/g;s/ც/c/g;s/ძ/dz/g;s/წ/ts/g;s/ჭ/tch/g' \
	|sed 's/ხ/kh/g;s/ჯ/j/g;s/ჰ/h/g' > $2

cat $1|sed 's/ა/a/g;s/ბ/b/g;s/გ/g/g;s/დ/d/g;s/ე/e/g' \
	|sed 's/ვ/v/g;s/ზ/z/g;s/თ/t/g;s/ი/i/g;s/კ/k/g' \
	|sed 's/ლ/l/g;s/მ/m/g;s/ნ/n/g;s/ო/o/g;s/პ/p/g' \
	|sed 's/ჟ/j/g;s/რ/r/g;s/ს/s/g;s/ტ/t/g;s/უ/u/g' \
	|sed 's/ფ/f/g;s/ქ/q/g;s/ღ/g/g;s/ყ/y/g;s/შ/sh/g' \
	|sed 's/ჩ/ch/g;s/ც/c/g;s/ძ/dz/g;s/წ/w/g;s/ჭ/tch/g' \
	|sed 's/ხ/x/g;s/ჯ/j/g;s/ჰ/h/g' >> $2

sort $2|uniq > $2".bak"; mv $2".bak" $2

