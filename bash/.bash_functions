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

function ping_gateway() {
  ping $(route -n get default | grep 'gateway' | awk '{print $2}')
}

function exec_specs_modified() {
  bin/rspec --format doc $(list_specs_modified | tr '\n' ' ')
}

function list_specs_modified() {
  git status | grep spec | grep -v 'vcr_cassettes' | grep -v 'factories' | grep -v 'shared_examples' | grep 'modified:' | cut -d: -f2-
}

function exec_specs_modified_in_branch() {
  bin/rspec --format doc $(list_specs_modified_in_branch | tr '\n' ' ')
}

function list_specs_modified_in_branch() {
  git whatchanged --name-only --pretty="" origin..HEAD | grep spec | grep -v vcr_cassettes | grep -v factories | sort -ru
}
