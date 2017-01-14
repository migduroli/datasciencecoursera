# While is the second major loop in R

count <- 0;
while (count < 10) {
  print(count)
  count <- count + 1;
}

# Take care with the condition as While loops are really
# infinite loops, so they can be really dangerous

# Multiple tests:
# Conditions are evaluated from left to right

z <- 5
while ( z >= 3 && z <= 10 ) {
  print(z)
  coin <- rbinom(1,1,0.5);
  if (coin == 1) {
    z <- z + 1;
  } else {
    z <- z - 1;
  }
}
