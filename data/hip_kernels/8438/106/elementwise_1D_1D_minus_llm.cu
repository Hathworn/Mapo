#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void elementwise_1D_1D_minus(float* in1, float* in2, float* out, int size) {
    // Calculate global index
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    // Ensure index is within bounds
    if (tid < size) {
        // Perform element-wise subtraction
        out[tid] = in1[tid] - in2[tid];
    }
}