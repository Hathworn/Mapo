```c
#include "hip/hip_runtime.h"
#include "includes.h"
#pragma once

__global__ void MapAdd32(int* one, const int* result, unsigned int mx, unsigned int width)
{
    unsigned int ppp = blockIdx.x * blockDim.x * 32 + threadIdx.x;

    #pragma unroll
    for (int i = 0; i < 32; ++i) { // Process 32 elements in a loop
        unsigned int rix = ppp % width;
        unsigned int riy = (ppp / mx) + ((ppp % mx) / width);
        unsigned int xxx = riy * width + rix;
        unsigned int ddx = riy * mx + rix;
        one[ddx] = result[xxx];
        ppp++;
    }
}