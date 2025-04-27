```cuda
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void stencil_1d(float *in, float *out)
{
    // shared memory
    __shared__ float smem[BDIM + 2 * RADIUS];

    // index to global memory
    int idx = threadIdx.x + blockIdx.x * blockDim.x;

    // index to shared memory for stencil calculation
    int sidx = threadIdx.x + RADIUS;

    // Load main data and halo into shared memory with fewer memory accesses
    if (threadIdx.x < RADIUS) {
        smem[sidx - RADIUS] = in[idx - RADIUS];
        smem[sidx + BDIM] = in[idx + BDIM];
    }
    smem[sidx] = in[idx];

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