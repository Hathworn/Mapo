```c
#include "hip/hip_runtime.h"
#include "includes.h"
/*
* Copyright 1993-2010 NVIDIA Corporation.  All rights reserved.
*
* NVIDIA Corporation and its licensors retain all intellectual property and
* proprietary rights in and to this software and related documentation.
* Any use, reproduction, disclosure, or distribution of this software
* and related documentation without an express license agreement from
* NVIDIA Corporation is strictly prohibited.
*
* Please refer to the applicable NVIDIA end user license agreement (EULA)
* associated with this source code for terms and conditions that govern
* your use of this NVIDIA software.
*
*/

#define SIZE    (100*1024*1024)

__global__ void histo_kernel( unsigned char *buffer, long size, unsigned int *histo ) {
    // Use shared memory for faster access
    __shared__ unsigned int temp[256];
    // Initialize shared memory for each thread block
    temp[threadIdx.x] = 0;
    __syncthreads();

    // Calculate the index and stride for processing buffer elements
    int i = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x;
    while (i < size) {
        // Use atomic add for accurate histogram calculation
        atomicAdd(&temp[buffer[i]], 1);
        i += stride;
    }

    __syncthreads(); // Ensure all updates to temp are done

    // Use atomic add to update global histogram from shared memory
    atomicAdd(&(histo[threadIdx.x]), temp[threadIdx.x]);
}