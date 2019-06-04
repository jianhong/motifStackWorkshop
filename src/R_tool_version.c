#include <R.h>
#include <Rinternals.h>
#include <R_ext/Rdynload.h>

SEXP matalign_version(){
  const char* ver= "v4a";
  return (SEXP)ver;
}

SEXP phylip_version(){
  const char* ver="3.696";
  return (SEXP)ver;
}

void R_init_Rtoolversion(DllInfo* info) {
  R_registerRoutines(info, NULL, NULL, NULL, NULL);
  R_useDynamicSymbols(info, TRUE);
}