PSQL="psql --username=freecodecamp --dbname=periodic_table --tuples-only -c"


if [[ $1 ]]
then
  if [[ $1 =~ ^[0-9]+$ ]]
  then
    DATA=$($PSQL "SELECT atomic_number, name, type, atomic_mass, melting_point_celsius, boiling_point_celsius, symbol  FROM properties INNER JOIN elements USING(atomic_number) INNER JOIN types USING(type_id) WHERE atomic_number = $1")
  else
    DATA=$($PSQL "SELECT atomic_number, name, type, atomic_mass, melting_point_celsius, boiling_point_celsius, symbol  FROM properties INNER JOIN elements USING(atomic_number) INNER JOIN types USING(type_id) WHERE symbol = '$1' OR name = '$1'")
  fi
  if [[ -z $DATA ]]
  then
    echo "I could not find that element in the database."
  else
    echo "$DATA" | while read ATOMIC_NUMBER BAR NAME BAR TYPE BAR MASS BAR MELTING BAR BOILING BAR SYMBOL
    do
      echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
    done
  fi

  
else
  echo "Please provide an element as an argument."
fi


