#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void __minkowskidist(double *A, int lda, double *B, int ldb, double *C, int ldc, int d, int nrows, int ncols, double p) {
printf("Warning, Minkowski distance not supported on arch <= 200\n");
}