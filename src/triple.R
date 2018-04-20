# ------------------------------------------------------------------
# C library
# ------------------------------------------------------------------
dyn.load("lib/triple.so")
triple <- function(x) {
  rtn <- 0
  call_result = .C("triple_value", x=as.numeric(x), result=rtn)
  call_result$result  
}
print("---C library---")
print(triple(3))

# ------------------------------------------------------------------
# C++ library
# ------------------------------------------------------------------
dyn.load("lib/triple_cpp.so")
triple_cpp <- function(x) {
  rtn <- 0
  call_result = .C("triple_value_cpp", x=as.numeric(x), result=rtn)
  call_result$result  
}
print("---C++ library---")
print(triple_cpp(3))

# ------------------------------------------------------------------
# Path vector (C++)
# ------------------------------------------------------------------
dyn.load("lib/triple_vector.so")
triple_vector <- function(vec) {
  call_result = .Call("triple_vector", x=as.vector(vec))
  call_result
}
print("---Pass vector---")
print(triple_vector(c(3, 4)))

# print(triple_vector(c('a', 'b')))
# triple_vector(c("a", "b")) でエラー: 
#   REAL() can only be applied to a 'numeric', not a 'character'
