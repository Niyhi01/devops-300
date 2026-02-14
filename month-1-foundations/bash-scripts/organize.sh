#!/bin/bash

#!/bin/bash

if [ -z "$1" ]; then
    echo "Please input a folder"
    exit 1
elif [ -d "$1" ]; then
    cd "$1"
    mkdir -p text images misc

    for file in *; do
        if [[ -f "$file" ]]; then           # only files
            if [[ "$file" == *.txt ]]; then
                mv "$file" text/
            elif [[ "$file" == *.jpg || "$file" == *.jpeg || "$file" == *.png ]]; then
                mv "$file" images/
            else
                mv "$file" misc/
            fi
        fi
    done

    exit 0
else
    echo "Please input a valid folder"
    exit 1
fi
