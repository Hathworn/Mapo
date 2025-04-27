#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void device_only_copy(float* output, float* input, size_t total_size) {
    // Calculate the global thread index
    size_t i = blockIdx.x * blockDim.x + threadIdx.x;

    // Loop unrolling
    size_t stride = blockDim.x * gridDim.x;
    while (i < total_size) {
        output[i] = input[i];
        i += stride;
    }

    // Remove __syncthreads() as it's unnecessary for this task
}