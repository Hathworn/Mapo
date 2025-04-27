#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void square_array(float* input, float* output, int n) {
    // Calculate global thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure index is within bounds
    if (idx < n) {
        // Perform squaring operation
        output[idx] = input[idx] * input[idx];
    }
}