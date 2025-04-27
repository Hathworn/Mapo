#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized 1D stencil kernel
__global__ void stencil_1d(float *in, float *out)
{
    // Shared memory with padding for halo
    __shared__ float smem[BDIM + 2 * RADIUS];

    // Calculate global and shared memory indices
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    int sidx = threadIdx.x + RADIUS;

    // Load main block of data into shared memory
    smem[sidx] = in[idx];

    // Load halo regions
    if (threadIdx.x < RADIUS)
    {
        smem[sidx - RADIUS] = in[idx - RADIUS];
        smem[sidx + BDIM] = in[idx + BDIM];
    }

    // Synchronize threads
    __syncthreads();

    // Compute stencil
    float tmp = coef[0] * smem[sidx]; // Center coefficient
    #pragma unroll
    for (int i = 1; i <= RADIUS; i++)
    {
        tmp += coef[i] * (smem[sidx + i] - smem[sidx - i]);
    }

    // Store result
    out[idx] = tmp;
}