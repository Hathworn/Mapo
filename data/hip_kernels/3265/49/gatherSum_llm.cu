```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gatherSum(int N, float *input, float *output) {
    // Calculate thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Return if thread index is out of bounds
    if (i >= N) return;

    // Initialize sum to zero
    float sum = 0.0f;
    
    // Accumulate input values in shared memory
    for (int j = 0; j < N; ++j) {
        sum += input[j];
    }
    
    // Write result to output
    output[i] = sum;
}