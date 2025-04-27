#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void elementwise_1D_1D_minus(float* in1, float* in2, float* out, int size) {
    // Initialize thread ID
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Calculate stride for iteration
    int stride = blockDim.x * gridDim.x;

    // Loop over elements with stride larger than the block size
    for (; tid < size; tid += stride) {
        // Perform element-wise subtraction
        out[tid] = in1[tid] - in2[tid];
    }
}