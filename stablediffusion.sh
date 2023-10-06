#!/bin/bash
STABLE_DIFF_DIR=/Users/brian/Documents/software/stable-diffusion
OUTPUT_DIR=/Users/brian/Documents/software/stable-diffusion/outputs

cd $STABLE_DIFF_DIR
virtualenv venv --python=python3.10
. venv/bin/activate

for var in "$@"
do
    python scripts/txt2img.py --prompt "$var" --n_samples 2 --n_iter 5 --plms --precision full
done

case ${@: - 1} in
    mail)
	osascript /Users/brian/.scripts/stablediffusion-email
	;;
    *)
	open -a finder $OUTPUT_DIR
	echo "done!"
	;;
esac
