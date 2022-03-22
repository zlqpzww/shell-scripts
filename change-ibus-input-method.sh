#!/bin/bash
# this is a script that change the ibus input method.
# only tested under bash version 5.1.12

input_methods=("pinyin" "xkb:us::eng")
current_input_method=$(ibus engine)
declare input_method_to_set
index=-1

for item in ${input_methods[@]};
do
	index=$(($index+1))
	if [ ${item} == ${current_input_method} ]; then
		next_index=$(($index+1))
		if [ $next_index == ${#input_methods[@]} ]; then
			next_index=0
		fi
		input_method_to_set=${input_methods[$next_index]}
		break
	fi
done
if [ $input_method_to_set == "" ]; then
	echo "can not find input method to set, current input method is "$current_input_method
else
	ibus engine ${input_method_to_set}
	echo "have set the input method of ibus to ${input_method_to_set}"
fi
