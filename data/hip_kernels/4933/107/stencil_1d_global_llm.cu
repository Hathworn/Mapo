#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void stencil_1d_global(float* in, float* out, float* dcoef) {
    // Shared memory
    __shared__ float smem[BDIM + 2 * RADIUS];

    // Index to global memory
    int idx = threadIdx.x + blockIdx.x * blockDim.x;

    // Index to shared memory for stencil calculation
    int sidx = threadIdx.x + RADIUS;

    // Read data from global memory into shared memory
    smem[sidx] = in[idx];

    // Read halo part to shared memory
    if (threadIdx.x < RADIUS) {
        smem[sidx - RADIUS] = in[idx - RADIUS];
        smem[sidx + BDIM] = in[idx + BDIM];
    }

    // Synchronize (ensure all the data is available)
    __syncthreads();

    // Apply the stencil
    float tmp = 0.0f;
    
    // Unroll the loop for better performance
    #pragma unroll RADIUS  // Unroll pragma applies directly to the loop
    for (int i = 1; i <= RADIUS; i++) {
        tmp += dcoef[i] * (smem[sidx + i] - smem[sidx - i]);
    }

    // Store the result
    out[idx] = tmp;
}