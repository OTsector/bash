#!/bin/bash

updatedb&&locate cache|grep 'cache/'|sed 's/cache\/.*/cache\//g;/\/usr\/share\//d'|sort|uniq|while read dir; do rm -rf "$dir"*; done&&echo done\!
