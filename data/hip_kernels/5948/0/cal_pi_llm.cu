#include "hip/hip_runtime.h"
#include "includes.h"
extern "C"
__global__ void cal_pi(float *sum, int nbin, float step, int nthreads, int nblocks)
{
    float x;
    int idx = blockIdx.x * blockDim.x + threadIdx.x; // Sequential thread index

    float local_sum = 0.0f; // Use local variable for reduction to minimize global memory access
    for (int i = idx; i < nbin; i += nthreads * nblocks) {
        x = (i + 0.5f) * step;
        local_sum += 4.0f / (1.0f + x * x);
    }
    sum[idx] = local_sum; // Update global memory once per thread
}