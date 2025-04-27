#include "hip/hip_runtime.h"
#include "includes.h"

/* Optimized kernel function */

__global__ void relu_gradient_kernel(const float *input, float *output, const float *in_grad, int n) {
    int index = blockDim.x * blockIdx.x + threadIdx.x;
    // Use shared memory for input and output to optimize memory access
    __shared__ float shared_input[BLOCK_SIZE];
    __shared__ float shared_output[BLOCK_SIZE];
    // Load data into shared memory
    if (index < n) {
        shared_input[threadIdx.x] = input[index];
        __syncthreads();
        float element = shared_input[threadIdx.x];
        // Directly write the result to shared output memory
        shared_output[threadIdx.x] = (element > 0) ? in_grad[index] : 0;
        __syncthreads();
        output[index] = shared_output[threadIdx.x];
    }
}
```
