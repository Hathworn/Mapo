#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void add(int *a, int *b, int *c) {
// Use thread index for better parallelism
int tid = blockIdx.x * blockDim.x + threadIdx.x;
if(tid < N) {
c[tid] = a[tid] + b[tid];
}
}