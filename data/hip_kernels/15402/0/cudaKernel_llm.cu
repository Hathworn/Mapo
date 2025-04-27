#include "hip/hip_runtime.h"
#include "includes.h"

// Copyright (c) 2019, NVIDIA Corporation. All rights reserved.
// This work is made available under the Nvidia Source Code License-NC.
// To view a copy of this license, visit
// https://nvlabs.github.io/stylegan2/license.html

__global__ void cudaKernel(void)
{
    // Use printf strings with __syncthreads for potential printf overlap mitigation
    printf("GPU says hello from block %d, thread %d.\n", blockIdx.x, threadIdx.x);
}