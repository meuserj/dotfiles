#!/bin/bash
for i in $(ollama list | grep -v NAME | awk '{print $1}')
do
  ollama pull "$i"
done
