#!/bin/bash

function hello_world(){
  echo 'Hello World'
}

# Syntax: repeat <number_of_times> <command>
function repeat() {
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
  git status | grep spec | grep -v 'vcr_cassettes\|factories\|shared_examples\|spec_helper\|split_configuration' | grep 'modified:' | cut -d: -f2-
}

function exec_specs_modified_in_branch() {
  bin/rspec --format doc $(list_specs_modified_in_branch | tr '\n' ' ')
}

function list_specs_modified_in_branch() {
  git whatchanged --name-only --pretty="" origin..HEAD | grep spec | grep -v 'vcr_cassettes\|factories\|spec_helper\|shared_examples\|split_configuration' | sort -ru
}

function list_files_modified_in_branch() {
  git whatchanged --name-only --pretty="" origin..HEAD 
}

function grep_and_kill() {
  search_term=$1
  ps aux | grep $1 | awk '{print $2}' | xargs kill
}

function log_ip() {
  touch ~/.log_ip.txt
  echo "****************" >> ~/.log_ip.txt
  date >> ~/.log_ip.txt
  myisp >> ~/.log_ip.txt
  echo "****************" >> ~/.log_ip.txt
}
