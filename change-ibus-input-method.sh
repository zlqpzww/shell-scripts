#!/bin/bash

# this is a script that change the ibus input method.
# only tested under jjj
input_methods=("pinyin" "xkb:us::eng")

current_input_method=$(ibus engine)

declare input_methods_to_set
next_index=-1

for item in ${input_methods[@]};
do
	next_index=$(($next_index+1))
	if [ ${item} == ${current_input_method} ]; then
		next_index=$(($next_index+1))
		break
	fi
done
# the next index is reach the end of array items, so we need to reset it to zero.
if [ $next_index != -1 ] && [ $next_index == ${#input_methods[@]} ]; then
	next_index=0
fi

if [ $next_index == -1 ]; then
	echo 'error can not find the next input method to set, the current input method is '$current_input_method
else
	ibus engine ${input_methods[$next_index]}
	echo "have set the input method of ibus to ${input_methods[$next_index]}"
fi
