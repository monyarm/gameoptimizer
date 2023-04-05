#!/bin/env bash

htmlmin(){
    minimize "_htmlmin" ${html_conf[@]}
}

_htmlmin(){
    start_task
    
    "$NODE_MODULES/.bin/html-minifier" --collapse-whitespace --remove-comments --remove-optional-tags --remove-redundant-attributes --remove-script-type-attributes --remove-tag-whitespace --use-short-doctype --minify-css true --minify-js true --collapse-boolean-attributes --collapse-inline-tag-whitespace --no-include-auto-generated-tags --keep-closing-slash --remove-attribute-quotes --remove-empty-attributes --remove-empty-elements --use-short-doctype "$src" -o "$dest" >> /dev/null 2>&1

    end_task
}
