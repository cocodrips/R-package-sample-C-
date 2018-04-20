#include <R.h>
#include <Rinternals.h>

extern "C" SEXP triple_vector(SEXP vec) {
  int n = length(vec);
  SEXP result = PROTECT(allocVector(REALSXP, n));
  for (int i = 0; i < n; i++) {
    REAL(result)[i] = REAL(vec)[i] * 2;
  }
  
  // Unprotect last allocated memory.
  UNPROTECT(1);
  return result;
}