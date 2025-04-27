#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void x6(float* x7, float* x8, float* x9, int x10) {
    int x12 = threadIdx.x + blockIdx.x * blockDim.x;
    
    // Use stride loop for better performance and coalesced memory access.
    for (int stride = gridDim.x * blockDim.x; x12 < x10; x12 += stride) {
        x9[x12] = x7[x12] + x8[x12];
    }
}