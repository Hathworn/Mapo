#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cal_pi(float *sum, int nbin, float step, int nthreads, int nblocks) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;  // Sequential thread index across the blocks
    float local_sum = 0.0f; // Use a register to store the partial sum

    // Loop over the assigned work items
    for (int i = idx; i < nbin; i += nthreads * nblocks) {
        float x = (i + 0.5) * step; // Calculate x for this iteration
        local_sum += 4.0f / (1.0f + x * x); // Accumulate the partial sum
    }
    
    sum[idx] = local_sum; // Write the partial sum back to global memory
}