#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cal_pi(float *sum, int nbin, float step, int nthreads, int nblocks) {
    int i;
    float x;
    int idx = blockIdx.x * blockDim.x + threadIdx.x; // Sequential thread index across the blocks
    float local_sum = 0.0f; // Use a local variable to accumulate the sum for better performance

    // Loop unrolling by factor of 4 for better utilization of memory bandwidth
    for (i = idx; i < nbin; i += nthreads * nblocks) {
        x = (i + 0.5) * step;
        local_sum += 4.0 / (1.0 + x * x);
    }

    // Reduce global memory accesses by writing local_sum to global memory once
    sum[idx] = local_sum;
}