#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void elementwise_1D_1D_sqrt(float* in, float* out, int size) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;
    
    // Optimize loop to remove condition inside and enhance warp execution
    while (tid < size) {
        out[tid] = sqrtf(in[tid]);  // Use single-precision sqrt function
        tid += stride;
    }
}