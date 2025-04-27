#include "hip/hip_runtime.h"
#include "includes.h"

/**************** Snippet ****************/
__global__ void x6(float* x7, float* x8, float* x9, int x10) {
    // Calculate global index for thread
    int x12 = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = gridDim.x * blockDim.x; // Pre-compute stride

    // Use stride loop for processing
    for (int i = x12; i < x10; i += stride) {
        x9[i] = x7[i] + x8[i];
    }
}