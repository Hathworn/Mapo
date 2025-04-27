#include "hip/hip_runtime.h"
#include "includes.h"
#pragma once

__global__ void MapSplit1(const int* one, int* result, unsigned int mx, unsigned int width)
{
    const unsigned int globalId = blockIdx.x * blockDim.x + threadIdx.x;

    // Calculate 2D grid position
    const unsigned int riy = globalId / mx;
    const unsigned int rix = globalId % width;
    
    if (rix < width) { // Ensure valid memory access
        const unsigned int xxx = riy * width + rix;
        const unsigned int ddx = riy * mx + rix;
        result[xxx] = one[ddx];
    }
}