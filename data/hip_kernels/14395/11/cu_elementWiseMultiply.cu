#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void cu_elementWiseMultiply(float *A, float B, const int n){
int tid = threadIdx.x + blockIdx.x * blockDim.x;
int stride = blockDim.x * gridDim.x;
while(tid < n){
A[tid] = __fmul_rd(A[tid], B);
tid += stride;
}
}