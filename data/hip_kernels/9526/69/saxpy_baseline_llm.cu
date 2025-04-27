#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void saxpy_baseline(float* y, float* x, float a, clock_t * timer_vals)
{
    // Precompute invariant expressions outside the loop
    unsigned int base_idx = blockIdx.x * COMPUTE_THREADS_PER_CTA + threadIdx.x;
    unsigned int stride = COMPUTE_THREADS_PER_CTA * CTA_COUNT;

    for (int i = 0; i < NUM_ITERS; i++) {
        unsigned int idx = i * stride + base_idx;
        y[idx] = a * x[idx] + y[idx];
    }
}