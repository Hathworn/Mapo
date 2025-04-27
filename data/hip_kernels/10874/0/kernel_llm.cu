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

#define N   (1024*1024)
#define FULL_DATA_SIZE   (N*20)

__global__ void kernel(int *a, int *b, int *c) {
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    if (idx < N) {
        // Utilize shared memory to reduce global memory accesses
        __shared__ float shared_a[256];
        __shared__ float shared_b[256];

        shared_a[threadIdx.x % 256] = a[idx];
        shared_b[threadIdx.x % 256] = b[idx];
        __syncthreads();

        int idx1 = (threadIdx.x + 1) % 256;
        int idx2 = (threadIdx.x + 2) % 256;

        // Calculate as and bs using shared memory
        float as = (shared_a[threadIdx.x % 256] + shared_a[idx1] + shared_a[idx2]) / 3.0f;
        float bs = (shared_b[threadIdx.x % 256] + shared_b[idx1] + shared_b[idx2]) / 3.0f;

        c[idx] = (as + bs) / 2;
    }
}