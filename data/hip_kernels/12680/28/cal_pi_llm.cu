#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cal_pi(float *sum, int nbin, float step, int nthreads, int nblocks) {
    int idx = blockIdx.x*blockDim.x + threadIdx.x;  // Sequential thread index across the blocks

    // Initialize sum for this thread
    float temp_sum = 0.0f;

    for (int i = idx; i < nbin; i += nthreads * nblocks) {
        float x = (i + 0.5f) * step;
        temp_sum += 4.0f / (1.0f + x * x);
    }

    // Store result in global sum array
    sum[idx] = temp_sum;
}