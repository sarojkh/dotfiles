#!/bin/bash

function hello_world(){
  echo 'Hello World'
}

# Syntax: run <number_of_times> <command>
function run() {
    number=$1
    shift
    for n in $(seq $number); do
      $@
    done
}
