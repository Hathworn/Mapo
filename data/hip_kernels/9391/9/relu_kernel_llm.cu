#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void relu_kernel(const float *input, float *output, int n) {
    // Calculate global index once and use a shared memory cache
    int index = blockDim.x * blockIdx.x + threadIdx.x;

    if (index < n) {
        float element = input[index];
        // Use a ternary operator for simplicity and possibly faster execution
        output[index] = element > 0 ? element : 0;
    }
}