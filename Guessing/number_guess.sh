#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=postgres -t -c"

echo "Enter your username:"
read NAME

USER_ID=$($PSQL "SELECT user_id FROM users WHERE name = '$NAME'")
if [[ -z $USER_ID ]]
then
  ADD_NAME=$($PSQL "INSERT INTO users(name) VALUES('$NAME')")
  echo "Welcome, $NAME! It looks like this is your first time here."
else
  INFO=$($PSQL "SELECT COUNT(play), MIN(play) FROM games GROUP BY user_id HAVING user_id = $USER_ID")
  echo "$INFO" | while read GAME_PLAY BAR BEST
  do
    echo "Welcome back, $NAME! You have played $GAME_PLAY games, and your best game took $BEST guesses."
  done
fi

RESULT=$(($RANDOM%1000 + 1))
echo "result $RESULT"
TIME=0

echo "Guess the secret number between 1 and 1000:"
read NUMBER
TIME=$(($TIME + 1))
while [[ ! $NUMBER =~ ^[0-9]+$ ]]
do
  TIME=$(($TIME + 1))
  echo "That is not an integer, guess again:"
  read NUMBER
done
while [[ $NUMBER != $RESULT ]]
do
  
  TIME=$(($TIME + 1))
  if [[ $NUMBER > $RESULT ]]
  then
    echo "It's lower than that, guess again:"
    read NUMBER
  else
    echo "It's higher than that, guess again:"
    read NUMBER
  fi
    
  
done

USER_ID=$($PSQL "SELECT user_id FROM users WHERE name = '$NAME'")
ADD_PLAY=$($PSQL "INSERT INTO games(play, user_id) VALUES($TIME, $USER_ID)")
echo "You guessed it in $TIME tries. The secret number was $RESULT. Nice job!"
