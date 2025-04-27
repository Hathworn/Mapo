#include "hip/hip_runtime.h"
#include "includes.h"

#define BDIM 256
#define RADIUS 3
__constant__ float coef[RADIUS+1];

__global__ void stencil_1d(float *in, float *out)
{
    // shared memory
    __shared__ float smem[BDIM + 2 * RADIUS];

    // index to global memory
    int idx = threadIdx.x + blockIdx.x * blockDim.x;

    // index to shared memory for stencil calculation
    int sidx = threadIdx.x + RADIUS;

    // Read data from global memory into shared memory
    smem[sidx] = in[idx];

    // read halo part to shared memory
    if (threadIdx.x < RADIUS)
    {
        smem[sidx - RADIUS] = in[max(idx - RADIUS, 0)];    // Boundary check to avoid access out of bounds
        smem[sidx + BDIM] = in[min(idx + BDIM, gridDim.x * blockDim.x - 1)];  // Boundary check for upper limit
    }

    // Synchronize (ensure all the data is available)
    __syncthreads();

    // Apply the stencil
    float tmp = 0.0f;

    #pragma unroll
    for (int i = 1; i <= RADIUS; i++)
    {
        tmp += coef[i] * (smem[sidx + i] - smem[sidx - i]);
    }

    // Store the result
    out[idx] = tmp;
}