#
#
#
#
#
#
#
#
#
#
#
#
#
if (condition) {
  command/s if condition true
} else {
  command/s if condition false
}
#
#
#
#
#
#
#Create a scalar
i <- 3
#If statement determing if the remainder of i/2 is 1
if (( i %% 2) == 1) {
  paste0(i, " is odd")
} else {
  paste0(i, " is even")
}
#
#
#
#
#
#
#
#
for (i in 0:9) {
  #If statement determining if the remainder of i/2 is 1
  if (( i %% 2) == 1) {
    print(paste0(i, " is odd"))
  } else {
    print(paste0(i, " is even"))
  }
}
#
#
#
#
#
#
#
