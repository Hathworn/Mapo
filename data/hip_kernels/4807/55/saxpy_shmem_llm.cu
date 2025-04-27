```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void saxpy_shmem (float* y, float* x, float a, clock_t * timer_vals)
{
    // Use shared memory to optimize data loading and computation
    __shared__ float sdata_x0[COMPUTE_THREADS_PER_CTA];
    __shared__ float sdata_y0[COMPUTE_THREADS_PER_CTA];
    int tid = threadIdx.x;
    
    for (int i = 0; i < NUM_ITERS; ++i) {
        unsigned int idx = i * COMPUTE_THREADS_PER_CTA * CTA_COUNT + blockIdx.x * COMPUTE_THREADS_PER_CTA + tid;
        
        // Load data into shared memory more efficiently
        __syncthreads();
        sdata_x0[tid] = x[idx];
        sdata_y0[tid] = y[idx];
        __syncthreads();
        
        // Compute SAXPY in shared memory
        y[idx] = a * sdata_x0[tid] + sdata_y0[tid];
    }
}