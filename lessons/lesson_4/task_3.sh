#!/bin/bash
# author: Eugeny Samoilov

default_ext='txt'
default_file='default'
default_value='test data'
path='./storage'
chmod 777 -R $path
path_file="$path/$default_file.$default_ext"
if [[ -f "$path_file" ]]; then
    echo "We have next default file: $path_file"
else
    touch $path_file
    echo "Just right now was created the next file: $path_file"
    echo -e "$default_value" >> $path_file
fi

echo "Do you want to change name or extention of file selected by you? y (by default) | n"
read do_change
if [[ "$do_change" != "y" && "$do_change" != "n" ]]; then
    do_change='y'
fi

if [[ "$do_change" = "y" ]]; then

    echo "Storage directory contains follow files:"
    if [ ! -d "$path" ]; then
        exit 1
    fi
    for file in "$path"/*; do
        if [ -f "$file" ]; then
            echo "$file"
        fi
    done
    echo "If you want to change name and/or extension of selected file you can type this filename withot path and press Enter after that"

    read selected_file

    if [ -f "$path/$selected_file" ]; then
        filename_with_ext=$(basename "$path/$selected_file")
        filename="${filename_with_ext%.*}"
        extension="${filename_with_ext##*.}"

        echo "Selected file: $path/$selected_file"
        echo "It contains the next value (part): "
        echo "----------"
        head "$path/$selected_file"
        echo "..."
        echo "----------"

        echo "Please type the name of file what do you need (by default it could be 'default')"
        read selected_name

        if [[ "$selected_name" = "" ]]; then
            selected_name="default"
        fi

        echo "Please type the extension of file (it might be one of these: txt (default), md, dat)"
        read selected_extension

        if [[ "$selected_extension" != "txt" && "$selected_extension" != "md" && "$selected_extension" != "dat" ]]; then
            selected_extension="txt"
        fi

        echo "So, in general you want to rename file $selected_file to $selected_name.$selected_extension. All right? y (default) / n"
        read confirmation

        if [[ "$confirmation" != "y" && "$confirmation" != "n" ]]; then
            confirmation="y"
        fi

        if [[ "$confirmation" = "y" ]]; then
            mv "$path/$selected_file" "$path/$selected_name.$selected_extension"
            echo "So, the filename of your file $selected_name.$selected_extension changed successfully! Moreover your new file has the value what origin file had:)"
        else
            echo "I hope that you try to use this application again"
        fi
    else
        echo "Selected file not found"
    fi
    
    echo "This way this brilliant application finish his work"
else
    echo "So, it is your change! Good by, dude!"
fi

echo "Storage directory contains follow files:"
if [ ! -d "$path" ]; then
    exit 1
fi
for file in "$path"/*; do
    if [ -f "$file" ]; then
        echo "$file"
    fi
done
