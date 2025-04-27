#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void device_only_copy(float* output, float* input, size_t total_size) {
    // Calculate global thread index
    size_t i = blockIdx.x * blockDim.x + threadIdx.x;
    // Loop unrolling for efficiency
    if (i < total_size) {
        output[i] = input[i];
    }
    __syncthreads();
}