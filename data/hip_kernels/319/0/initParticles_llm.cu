```c
#include "hip/hip_runtime.h"
#include "includes.h"
/// Copyright (C) 2016 Giuseppe Bilotta <giuseppe.bilotta@gmail.com>
/// License: GPLv3

#define restrict __restrict__

typedef unsigned int uint;
typedef unsigned int hashKey;
typedef ushort4 particleinfo;

__global__ void initParticles( particleinfo * restrict infoArray, hashKey * restrict hashArray, uint * restrict idxArray, uint numParticles)
{
    uint idx = threadIdx.x + blockIdx.x * blockDim.x;
    
    // Ensure idx is within bounds
    if (idx >= numParticles)
        return;

    // Directly assign index
    idxArray[idx] = idx;

    // Initialize particleinfo
    particleinfo info;
    info.x = idx & 3; // x optimized using bitwise AND for modulo 4
    info.y = 0;
    info.z = static_cast<ushort>(idx); // Use static_cast for type safety
    info.w = static_cast<ushort>(idx >> 16);

    infoArray[idx] = info;

    // Simplified hash calculation
    hashArray[idx] = idx / 17 + (idx % 17);
}