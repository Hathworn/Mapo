#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void elementwise_1D_1D_log(float* in, float* out, int size) {
    // Calculate global thread index 
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;
    
    // Loop unrolling for better performance
    while (tid < size) {
        out[tid] = log(in[tid]);
        tid += stride;
    }
}