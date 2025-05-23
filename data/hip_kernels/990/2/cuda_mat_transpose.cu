#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void cuda_mat_transpose(const double* src, double* dst, int colssrc, int colsdst, int n){
int tid = threadIdx.x + blockIdx.x * blockDim.x;
int stride = blockDim.x * gridDim.x;
while(tid < n){
int cdst = tid % colsdst;
int rdst = tid / colsdst;
int rsrc = cdst;
int csrc = rdst;
dst[tid] = src[rsrc * colssrc + csrc];
tid += stride;
}
}