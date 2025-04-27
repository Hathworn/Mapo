#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void convert_kernel(unsigned int *bins32, uint8_t *bins8, unsigned int num_bins) {
    // Calculate the global thread index
    int thid = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Loop over elements assigned to the current thread
    for (int i = thid; i < num_bins; i += blockDim.x * gridDim.x) {
        // Use local register to reduce global memory access
        unsigned int reg_bin = bins32[i];
        
        // Standard conditional operation
        bins8[i] = (reg_bin > 255) ? 255u : (uint8_t)reg_bin;
    }
}