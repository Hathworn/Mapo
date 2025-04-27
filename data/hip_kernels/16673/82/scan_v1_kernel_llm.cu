#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scan_v1_kernel(float *d_output, float *d_input, int length)
{
    int idx = blockDim.x * blockIdx.x + threadIdx.x;

    // Initialize element to zero
    float element = 0.f;

    // Use shared memory for partial sums to improve memory access speed
    __shared__ float shared_memory[1024]; // Adjust size based on block size

    // Load data from global to shared memory
    if (idx < length) {
        shared_memory[threadIdx.x] = d_input[idx];
    }
    __syncthreads(); // Synchronize to ensure all loads are complete

    // Perform the scan operation within shared memory
    for (int offset = 0; offset <= threadIdx.x; ++offset) {
        element += shared_memory[threadIdx.x - offset];
    }

    // Write the result back to the output array if within bounds
    if (idx < length) {
        d_output[idx] = element;
    }
}