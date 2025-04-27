#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void elementwise_1D_1D_exp(float* in, float* out, int size) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;
    
    // Ensure tid starts within bounds and use stride efficiently
    while (tid < size) {
        out[tid] = exp(in[tid]);
        tid += stride;
    }
}