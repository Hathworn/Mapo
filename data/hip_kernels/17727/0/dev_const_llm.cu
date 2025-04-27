#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void dev_const(float *px, float k) {
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    
    // Check if tid is within array bounds
    if (tid < blockDim.x * gridDim.x) {
        px[tid] = k;
    }
}