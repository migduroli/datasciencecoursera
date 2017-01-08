# Range-for loop:

for (i in 1:10) {
  print(i)
}

# also in strings:

x <- c("a","b","c","d");
# seq_along contains the right iterator so 
# we don't need to know the size a priori. This is 
# helpful to avoid 1:length(x)

for (i in seq_along(x))
{
  print(x[i])
}

# Now for-ranged loop:
for (letter in x)
{
  print(letter)
}


