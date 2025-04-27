#include "hip/hip_runtime.h"
#include "includes.h"

/*
* Copyright 1993-2010 NVIDIA Corporation.  All rights reserved.
*
* Please refer to the NVIDIA end user license agreement (EULA) associated
* with this source code for terms and conditions that govern your use of
* this software. Any use, reproduction, disclosure, or distribution of
* this software and related documentation outside the terms of the EULA
* is strictly prohibited.
*
*/

/*
* Multi-GPU sample using OpenMP for threading on the CPU side
* needs a compiler that supports OpenMP 2.0
*/

using namespace std;

// a simple kernel that simply increments each array element by b

// Optimize using 1D grid for better memory access pattern
__global__ void kernelAddConstant(int *g_a, const int b)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < N) {  // Check array bounds
        g_a[idx] += b;  // Increment array element
    }
}