#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void divScalar(float* in, float* out, float div, int size) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;
    
    // Unrolling loop for better performance
    for (; tid + stride < size; tid += stride * 2) {
        out[tid] = in[tid] / div;
        out[tid + stride] = in[tid + stride] / div;
    }
    
    // Handle remaining elements
    if (tid < size) {
        out[tid] = in[tid] / div;
    }
}