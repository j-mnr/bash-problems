#!/usr/bin/env bash

# local version: 1.6.0.0

@test "stating something" {
  run bash bob.sh 'Tom-ay-to, tom-aaaah-to.'
  (( status == 0 ))
  [[ $output == "Whatever." ]]
}

@test "shouting" {
  run bash bob.sh 'WATCH OUT!'
  (( status == 0 ))
  [[ $output == "Whoa, chill out!" ]]
}

@test "shouting gibberish" {
  run bash bob.sh 'FCECDFCAAB'
  (( status == 0 ))
  [[ $output == "Whoa, chill out!" ]]
}

@test "asking a question" {
  run bash bob.sh 'Does this cryogenic chamber make me look fat?'
  (( status == 0 ))
  [[ $output == "Sure." ]]
}

@test "asking a numeric question" {
  run bash bob.sh 'You are, what, like 15?'
  (( status == 0 ))
  [[ $output == "Sure." ]]
}

@test "asking gibberish" {
  run bash bob.sh 'fffbbcbeab?'
  (( status == 0 ))
  [[ $output == "Sure." ]]
}

@test "talking forcefully" {
  run bash bob.sh "Hi there!"
  (( status == 0 ))
  [[ $output == "Whatever." ]]
}

@test "using acronyms in regular speech" {
  run bash bob.sh "It's OK if you don't want to go work for NASA."
  (( status == 0 ))
  [[ $output == "Whatever." ]]
}

@test "forceful question" {
  run bash bob.sh "WHAT'S GOING ON?"
  (( status == 0 ))
  [[ $output == "Calm down, I know what I'm doing!" ]]
}

@test "shouting numbers" {
  run bash bob.sh '1, 2, 3 GO!'
  (( status == 0 ))
  [[ $output == "Whoa, chill out!" ]]
}

@test "no letters" {
  run bash bob.sh '1, 2, 3'
  (( status == 0 ))
  [[ $output == "Whatever." ]]
}

@test "question with no letters" {
  run bash bob.sh '4?'
  (( status == 0 ))
  [[ $output == "Sure." ]]
}

@test "shouting with special characters" {
  run bash bob.sh 'ZOMG THE %^*@#$(*^ ZOMBIES ARE COMING!!11!!1!'
  (( status == 0 ))
  [[ $output == "Whoa, chill out!" ]]
}

@test "shouting with no exclamation mark" {
  run bash bob.sh 'I HATE THE DENTIST'
  (( status == 0 ))
  [[ $output == "Whoa, chill out!" ]]
}

@test "statement containing question mark" {
  run bash bob.sh 'Ending with ? means a question.'
  (( status == 0 ))
  [[ $output == "Whatever." ]]
}

@test "non-letters with question" {
  run bash bob.sh ':) ?'
  (( status == 0 ))
  [[ $output == "Sure." ]]
}

@test "prattling on" {
  run bash bob.sh 'Wait! Hang on. Are you going to be OK?'
  (( status == 0 ))
  [[ $output == "Sure." ]]
}

@test "silence" {
  run bash bob.sh ''
  (( status == 0 ))
  [[ $output == "Fine. Be that way!" ]]
}

@test "prolonged silence" {
  run bash bob.sh '          '
  (( status == 0 ))
  [[ $output == "Fine. Be that way!" ]]
}

@test "alternate silence" {
  run bash bob.sh $'\t\t\t\t\t\t\t\t\t\t'
  (( status == 0 ))
  [[ $output == "Fine. Be that way!" ]]
}

@test "multiple line question" {
  run bash bob.sh $'\nDoes this cryogenic chamber make me look fat?\nNo'
  (( status == 0 ))
  [[ $output == "Whatever." ]]
}

@test "starting with whitespace" {
  run bash bob.sh '         hmmmmmmm...'
  (( status == 0 ))
  [[ $output == "Whatever." ]]
}

@test "ending with whitespace" {
  run bash bob.sh 'Okay if like my  spacebar  quite a bit?   '
  (( status == 0 ))
  [[ $output == "Sure." ]]
}
# This test might act differently depending on your platform
@test "other whitespace" {
  run bash bob.sh $'\n\r \t'
  (( status == 0 ))
  [[ $output == "Fine. Be that way!" ]]
}

@test "non-question ending with whitespace" {
  run bash bob.sh 'This is a statement ending with whitespace      '
  (( status == 0 ))
  [[ $output == "Whatever." ]]
}

@test "no input is silence" {
  run bash bob.sh
  (( status == 0 ))
  [[ $output == "Fine. Be that way!" ]]
}

# bash-specific tests
@test "yelling a filename expansion" {
  run bash bob.sh '*READ* !'
  (( status == 0 ))
  [[ $output == "Whoa, chill out!" ]]
}

@test "asking a filename expansion" {
  run bash bob.sh 'bob???'
  (( status == 0 ))
  [[ $output == "Sure." ]]
}
