#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void lookupTableCuda(const uint8_t *in, uint32_t rowSizeIn, uint8_t *out, uint32_t rowSizeOut, uint32_t width, uint32_t height, uint8_t *table)
{
    // Calculate global thread index for 2D grid
    const uint32_t x = blockDim.x * blockIdx.x + threadIdx.x;
    const uint32_t y = blockDim.y * blockIdx.y + threadIdx.y;

    // Use shared memory to reduce global memory access
    __shared__ uint8_t localTable[256];  // Assuming table size is known as 256
    
    // Load table into shared memory only by the first thread once
    if (threadIdx.x == 0 && threadIdx.y == 0) {
        for (int i = 0; i < 256; i++) {
            localTable[i] = table[i];
        }
    }
    __syncthreads();  // Ensure all threads have the table data

    // Perform the lookup operation
    if (x < width && y < height) {
        out[y * rowSizeOut + x] = localTable[in[y * rowSizeIn + x]];
    }
}