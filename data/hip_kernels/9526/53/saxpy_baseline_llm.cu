#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void saxpy_optimized(float* y, float* x, float a, clock_t* timer_vals)
{
  // Pre-compute index offset to avoid repeated calculation inside the loop
  unsigned int base_idx = blockIdx.x * COMPUTE_THREADS_PER_CTA + threadIdx.x;
  for (int i = 0; i < NUM_ITERS; i++) {
    unsigned int idx = i * COMPUTE_THREADS_PER_CTA * CTA_COUNT + base_idx;
    y[idx] = a * x[idx] + y[idx];
  }
}