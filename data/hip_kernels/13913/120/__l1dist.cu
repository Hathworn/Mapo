#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void __l1dist(float *A, int lda, float *B, int ldb, float *C, int ldc, int d, int nrows, int ncols, float p) {
printf("Warning, Lidist not supported on arch <= 200\n");
}