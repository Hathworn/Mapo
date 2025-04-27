#include "hip/hip_runtime.h"
#include "includes.h"
#pragma once

__global__ void MapAdd1(int* one, const int* result, unsigned int mx, unsigned int width)
{
    // Use shared memory and avoid repeated computation for better performance
    const unsigned int ppp = blockIdx.x * blockDim.x + threadIdx.x;

    if (ppp >= mx * width) return; // Boundary check to prevent out-of-bounds memory access
    
    const unsigned int rix = ppp % width; // Calculate column index
    const unsigned int riy = ppp / width; // Calculate row index
    const unsigned int xxx = riy * width + rix; // Compute index in result array
    const unsigned int ddx = riy * mx + rix; // Compute index in one array

    __shared__ int sharedResult;
    if (threadIdx.x == 0) {
        sharedResult = result[xxx]; // Load data into shared memory once per block
    }
    __syncthreads(); // Ensure all threads have loaded before proceeding

    one[ddx] = sharedResult; // Use shared memory to minimize global memory access
}