#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void saxpy_shmem(float* y, float* x, float a, clock_t * timer_vals) {
    extern __shared__ float sdata[]; // Use a single shared memory allocation
    float* sdata_x0 = sdata;
    float* sdata_y0 = sdata + COMPUTE_THREADS_PER_CTA;
    
    int tid = threadIdx.x;
    int base_idx = blockIdx.x * COMPUTE_THREADS_PER_CTA + tid;
    
    for (int i = 0; i < NUM_ITERS; ++i) {
        unsigned int idx = i * COMPUTE_THREADS_PER_CTA * CTA_COUNT + base_idx;
        
        // Load x and y values into shared memory
        sdata_x0[tid] = x[idx];
        sdata_y0[tid] = y[idx];
        __syncthreads();
        
        // Compute y using shared memory values
        y[idx] = a * sdata_x0[tid] + sdata_y0[tid];
        __syncthreads(); // Ensure all threads have completed
    }
}