#include "hip/hip_runtime.h"
#include "includes.h"

#define BDIM 256
#define RADIUS 3
__constant__ float coef[RADIUS + 1];

__global__ void stencil_1d(float *in, float *out, int N) {
    // Shared memory
    __shared__ float smem[BDIM + 2 * RADIUS];

    // Index to global memory
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Loop over the grid until all elements are processed
    while (idx < N) {
        // Index to shared memory for stencil calculation
        int sidx = threadIdx.x + RADIUS;

        // Read data from global memory into shared memory
        smem[sidx] = in[idx];

        // Read halo part to shared memory
        if (threadIdx.x < RADIUS) {
            // Avoids out-of-bound memory reads
            if (idx >= RADIUS) {
                smem[sidx - RADIUS] = in[idx - RADIUS];
            }
            if (idx + BDIM < N) {
                smem[sidx + BDIM] = in[idx + BDIM];
            }
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
        if (idx < N) {
            out[idx] = tmp;
        }

        // Update idx for next iteration
        idx += gridDim.x * blockDim.x;
    }
}