#include "hip/hip_runtime.h"
#include "includes.h"
#pragma once

__global__ void MapSplit32(const int* one, int* result, unsigned int mx, unsigned int width)
{
    unsigned int base_ppp = blockIdx.x * blockDim.x * 32 + threadIdx.x;
    
    // Use loop to process unrolled code parts
    for(unsigned int offset = 0; offset < 32; ++offset) {
        unsigned int ppp = base_ppp + offset;
        unsigned int rix = ppp % width;
        unsigned int riy = (ppp / mx) + ((ppp % mx) / width);
        unsigned int xxx = riy * width + rix;
        unsigned int ddx = riy * mx + rix;
        result[xxx] = one[ddx]; 
    }
}