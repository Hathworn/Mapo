#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void increment(char* data, size_t length)
{
    // Optimize memory access by using a block-local variable for length
    size_t global_index = threadIdx.x + blockIdx.x * blockDim.x;
    if (global_index < length) {
        // Ensure coalesced memory access by accessing data by global_index
        data[global_index]++;
    }
}