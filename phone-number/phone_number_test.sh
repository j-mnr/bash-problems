#!/usr/bin/env bash

# local version: 1.7.0.0

@test "cleans the number" {
  run bash phone_number.sh "(223) 456-7890"
  (( status == 0 ))
  [[ $output == "2234567890" ]]
}

@test "cleans numbers with dots" {
  run bash phone_number.sh "223.456.7890"
  (( status == 0 ))
  [[ $output == "2234567890" ]]
}

@test "cleans numbers with multiple spaces" {
  run bash phone_number.sh "223 456   7890   "
  (( status == 0 ))
  [[ $output == "2234567890" ]]
}

@test "invalid when 9 digits" {
  run bash phone_number.sh "123456789"
  (( status == 1 ))
  [[ $output == "Invalid number.  [1]NXX-NXX-XXXX N=2-9, X=0-9" ]]
}

@test "invalid when 11 digits does not start with a 1" {
  run bash phone_number.sh "22234567890"
  (( status == 1 ))
  [[ $output == "Invalid number.  [1]NXX-NXX-XXXX N=2-9, X=0-9" ]]
}

@test "valid when 11 digits and starting with 1" {
  run bash phone_number.sh "12234567890"
  (( status == 0 ))
  [[ $output == "2234567890" ]]
}

@test "valid when 11 digits and starting with 1 even with punctuation" {
  run bash phone_number.sh "+1 (223) 456-7890"
  (( status == 0 ))
  [[ $output == "2234567890" ]]
}

@test "invalid when more than 11 digits" {
  run bash phone_number.sh "321234567890"
  (( status == 1 ))
  [[ $output == "Invalid number.  [1]NXX-NXX-XXXX N=2-9, X=0-9" ]]
}

@test "invalid with letters" {
  run bash phone_number.sh "123-abc-7890"
  (( status == 1 ))
  [[ $output == "Invalid number.  [1]NXX-NXX-XXXX N=2-9, X=0-9" ]]
}

@test "invalid with punctuations" {
  run bash phone_number.sh "123-@:!-7890"
  (( status == 1 ))
  [[ $output == "Invalid number.  [1]NXX-NXX-XXXX N=2-9, X=0-9" ]]
}

@test "invalid if area code starts with 0" {
  run bash phone_number.sh "(023) 456-7890"
  (( status == 1 ))
  [[ $output == "Invalid number.  [1]NXX-NXX-XXXX N=2-9, X=0-9" ]]
}

@test "invalid if area code starts with 1" {
  run bash phone_number.sh "(123) 456-7890"
  (( status == 1 ))
  [[ $output == "Invalid number.  [1]NXX-NXX-XXXX N=2-9, X=0-9" ]]
}

@test "invalid if exchange code starts with 0" {
  run bash phone_number.sh "(223) 056-7890"
  (( status == 1 ))
  [[ $output == "Invalid number.  [1]NXX-NXX-XXXX N=2-9, X=0-9" ]]
}

@test "invalid if exchange code starts with 1" {
  run bash phone_number.sh "(223) 156-7890"
  (( status == 1 ))
  [[ $output == "Invalid number.  [1]NXX-NXX-XXXX N=2-9, X=0-9" ]]
}

@test "invalid if area code starts with 0 on valid 11-digit number" {
  run bash phone_number.sh "1 (023) 456-7890"
  (( status == 1 ))
  [[ $output == "Invalid number.  [1]NXX-NXX-XXXX N=2-9, X=0-9" ]]
}

@test "invalid if area code starts with 1 on valid 11-digit number" {
  run bash phone_number.sh "1 (123) 456-7890"
  (( status == 1 ))
  [[ $output == "Invalid number.  [1]NXX-NXX-XXXX N=2-9, X=0-9" ]]
}

@test "invalid if exchange code starts with 0 on valid 11-digit number" {
  run bash phone_number.sh "1 (223) 056-7890"
  (( status == 1 ))
  [[ $output == "Invalid number.  [1]NXX-NXX-XXXX N=2-9, X=0-9" ]]
}

@test "invalid if exchange code starts with 1 on valid 11-digit number" {
  run bash phone_number.sh "1 (223) 156-7890"
  (( status == 1 ))
  [[ $output == "Invalid number.  [1]NXX-NXX-XXXX N=2-9, X=0-9" ]]
}
