#!/bin/bash

echo -e "\n~~~~~ MY SALON ~~~~~\n"

PSQL="psql --username=freecodecamp --dbname=salon --tuples-only -c"

MAIN() {
  SERVICE_LIST=$($PSQL "SELECT * FROM services")
  echo "$SERVICE_LIST" | while read SERVICE_ID BAR NAME
  do
    echo "$SERVICE_ID) $NAME"
  done
}

echo -e "\nWelcome to My Salon, how can I help you?\n"
MAIN
read SERVICE_ID_SELECTED
SERVICE_ID=$($PSQL "SELECT service_id FROM services WHERE service_id = $SERVICE_ID_SELECTED")
if [[ -z $SERVICE_ID ]]
then
  MAIN "I could not find that service. What would you like today?"
else
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  if [[ -z $CUSTOMER_ID ]]
  then
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
    echo -e "\nWhat time would you like your cut, Fabio?"
    read SERVICE_TIME
    INSERT_RESULT=$($PSQL "INSERT INTO customers (name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
    if [[ $INSERT_RESULT == 'INSERT 0 1' ]]
    then
      CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
      INSERT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID, '$SERVICE_TIME')")
      if [[ $INSERT_RESULT == 'INSERT 0 1' ]]
      then
        SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID")
        echo "I have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
      fi
    fi
  else
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
    echo -e "\nWhat time would you like your color, $CUSTOMER_NAME"
    read SERVICE_TIME
    INSERT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID, '$SERVICE_TIME')")
      if [[ $INSERT_RESULT == 'INSERT 0 1' ]]
      then
        SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID")
        echo "I have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
      fi
  fi
fi
