#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void OPT_3_SIZES_SUM(int* lcmsizes, int n) {
    // Use thread index for parallel addition
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if(i < n) atomicAdd(&lcmsizes[i+1], lcmsizes[i]);
}