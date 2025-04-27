#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function
__global__ void elementwise_1D_1D_div(float* in1, float* in2, float* out, int size) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;
    
    // Use grid-stride loop for better memory coalescing
    for (; tid < size; tid += stride) {
        // Ensure index is within array bounds
        if (tid < size) {
            out[tid] = in1[tid] / in2[tid];
        }
    }
}