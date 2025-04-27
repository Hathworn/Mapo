#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void stencil_1d_global (float* in, float* out, float * dcoef)
{
    // shared memory
    __shared__ float smem[BDIM + 2 * RADIUS];

    // index to global memory
    int idx = threadIdx.x + blockIdx.x * blockDim.x;

    // index to shared memory for stencil calculation
    int sidx = threadIdx.x + RADIUS;

    // Read data from global memory into shared memory
    if (idx < N) {
        smem[sidx] = in[idx];
        
        // read halo part to shared memory if within bounds
        if (threadIdx.x < RADIUS) {
            smem[sidx - RADIUS] = (idx >= RADIUS) ? in[idx - RADIUS] : 0.0f;  // Prevent out-of-bounds access
            smem[sidx + BDIM] = (idx + BDIM < N) ? in[idx + BDIM] : 0.0f;      // Prevent out-of-bounds access
        }
    }

    // Synchronize (ensure all the data is available)
    __syncthreads();

    // Apply the stencil only if idx is within the valid range
    if (idx < N) {
        float tmp = 0.0f;
        #pragma unroll
        for (int i = 1; i <= RADIUS; i++) {
            tmp += dcoef[i] * (smem[sidx + i] - smem[sidx - i]);
        }

        // Store the result
        out[idx] = tmp;
    }
}