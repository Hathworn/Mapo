#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void stencil_1d(float *in, float *out)
{
    // Shared memory
    extern __shared__ float smem[];

    // Index to global memory
    int idx = threadIdx.x + blockIdx.x * blockDim.x;

    // Index to shared memory for stencil calculation
    int sidx = threadIdx.x + RADIUS;

    // Read data from global memory into shared memory
    smem[sidx] = in[idx];

    // Read halo part to shared memory with bounds check
    if (threadIdx.x < RADIUS) {
        smem[sidx - RADIUS] = in[max(0, idx - RADIUS)]; // Ensure reading within bounds
        smem[sidx + BDIM] = in[min(idx + BDIM, gridDim.x * blockDim.x - 1)]; // Ensure reading within bounds
    }

    // Synchronize (ensure all the data is available)
    __syncthreads();

    // Apply the stencil
    float tmp = 0.0f;
    #pragma unroll
    for (int i = 1; i <= RADIUS; i++) {
        tmp += coef[i] * (smem[sidx + i] - smem[sidx - i]);
    }

    // Store the result
    out[idx] = tmp;
}