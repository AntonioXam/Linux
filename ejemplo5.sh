#!/bin/bash
echo "Enter a word:"
read word
reverse=$(echo $word | rev)
if [ $word = $reverse ]; then
  echo "The word is a palindrome"
else
  echo "The word is not a palindrome"
fi