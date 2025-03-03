#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void VecAdd(float *A, float *B, float *C){
int i = threadIdx.x;
C[i] = A[i] + B[i];
}