#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void stencil_1d(float *in, float *out, int N)
{
    // shared memory with optimization for bank conflicts
    __shared__ float smem[BDIM + 2 * RADIUS];

    // optimized index calculation for global memory
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // process multiple elements per thread for better occupancy
    int total_threads = gridDim.x * blockDim.x;
    for (int i = idx; i < N; i += total_threads)
    {
        // index to shared memory for stencil calculation
        int sidx = threadIdx.x + RADIUS;

        // Read data from global memory into shared memory
        if (i < N) smem[sidx] = in[i];

        // read halo part to shared memory, add range check to prevent out of bounds access
        if (threadIdx.x < RADIUS)
        {
            if (i >= RADIUS) smem[sidx - RADIUS] = in[i - RADIUS];
            if (i + BDIM < N) smem[sidx + BDIM] = in[i + BDIM];
        }

        // Synchronize (ensure all the data is available)
        __syncthreads();

        // Apply the stencil
        float tmp = 0.0f;

        #pragma unroll
        for (int j = 1; j <= RADIUS; j++)
        {
            tmp += coef[j] * (smem[sidx + j] - smem[sidx - j]);
        }

        // store the result only if within bounds
        if (i < N) out[i] = tmp;

        // Synchronize to prevent race condition in smem usage
        __syncthreads();
    }
}