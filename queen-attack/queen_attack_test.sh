#!/usr/bin/env bash

# local version: 2.3.0.0

# Test creation of Queens with invalid positions

@test "queen must have positive row" {
    run  bash queen_attack.sh -w -2,2 -b 7,7
    (( status == 1 ))
    [[ $output == *"row not positive"* ]]
}

@test "queen must have row on board" {
    run  bash queen_attack.sh -w 8,4 -b 7,7
    (( status == 1 ))
    [[ $output == *"row not on board"* ]]
}

@test "queen must have positive column" {
    run  bash queen_attack.sh -w 2,-2 -b 7,7
    (( status == 1 ))
    [[ $output == *"column not positive"* ]]
}

@test "queen must have column on board" {
    run  bash queen_attack.sh -w 4,8 -b 7,7
    (( status == 1 ))
    [[ $output == *"column not on board"* ]]
}

@test "same position" {
    run  bash queen_attack.sh -w 7,7 -b 7,7
    (( status == 1 ))
    [[ $output == *"same position"* ]]
}


# Test the ability of one queen to attack another

@test "can not attack" {
    run bash queen_attack.sh -w 2,4 -b 6,6
    (( status == 0 )) 
    [[ $output == "false" ]]
}

@test "can attack on same row" {
    run bash queen_attack.sh -w 2,4 -b 2,6
    (( status == 0 )) 
    [[ $output == "true" ]]
}

@test "can attack on same column" {
    run bash queen_attack.sh -w 4,5 -b 2,5
    (( status == 0 )) 
    [[ $output == "true" ]]
}

@test "can attack on first diagonal" {
    run bash queen_attack.sh -w 2,2 -b 0,4
    (( status == 0 )) 
    [[ $output == "true" ]]
}

@test "can attack on second diagonal" {
    run bash queen_attack.sh -w 2,2 -b 3,1
    (( status == 0 )) 
    [[ $output == "true" ]]
}

@test "can attack on third diagonal" {
    run bash queen_attack.sh -w 2,2 -b 1,1
    (( status == 0 )) 
    [[ $output == "true" ]]
}

@test "can attack on fourth diagonal" {
    run bash queen_attack.sh -w 1,7 -b 0,6
    (( status == 0 )) 
    [[ $output == "true" ]]
}
