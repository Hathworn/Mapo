#include "hip/hip_runtime.h"
#include "includes.h"
/*******************************************************
* Copyright (c) 2015-2019, ArrayFire
* All rights reserved.
*
* This file is distributed under 3-clause BSD license.
* The complete license agreement can be obtained at:
* http://arrayfire.com/licenses/BSD-3-Clause
********************************************************/

#define USE_FORGE_CUDA_COPY_HELPERS

#define PI 3.14159265359

const unsigned DIMX      = 640;
const unsigned DIMY      = 480;
const float MINIMUM      = 1.0f;
const float MAXIMUM      = 20.f;
const float STEP         = 2.0f;

// Optimized kernel function
__global__ void pointGenKernel(float* points, float* dirs, int nelems, float minimum, float step) {
    // Calculate unique thread identifier for improved parallelism
    int id = blockDim.x * blockIdx.x + threadIdx.x + (blockDim.y * blockIdx.y + threadIdx.y) * nelems;
    
    if (id < nelems * nelems) { // Ensure within bounds
        int i = id % nelems;
        int j = id / nelems;
        
        float x = minimum + i * step;
        float y = minimum + j * step;
        
        points[2 * id + 0] = x;
        points[2 * id + 1] = y;
        
        float angle_multiplier = 2.0f * PI / 10.0f; // Precompute constant multiplier
        dirs[2 * id + 0] = sinf(angle_multiplier * x); // Reused multiplier
        dirs[2 * id + 1] = sinf(angle_multiplier * y); // Reused multiplier
    }
}