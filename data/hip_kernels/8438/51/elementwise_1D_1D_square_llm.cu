#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void elementwise_1D_1D_square(float* in, float* out, int size) {
    // Calculate unique global thread index
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure thread operates within bounds
    if (tid < size) {
        out[tid] = in[tid] * in[tid];
    }
}