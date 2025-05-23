#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void strided_access(float* a,int s,int max){
int idx = blockIdx.x*blockDim.x + threadIdx.x;
if (idx*s >= max) return;
a[idx*s] = a[idx*s] + 1;
}