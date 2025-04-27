#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void saxpy_float4s_shmem (float* y, float* x, float a, clock_t *timer_vals)
{
    // Use float4 shared memory to optimize access pattern
    volatile __shared__ float4 sdata_x[COMPUTE_THREADS_PER_CTA];
    volatile __shared__ float4 sdata_y[COMPUTE_THREADS_PER_CTA];
    int tid = threadIdx.x;

    for (int i = 0; i < NUM_ITERS / 4; i++) {
        unsigned int idx = i * COMPUTE_THREADS_PER_CTA * CTA_COUNT + blockIdx.x * COMPUTE_THREADS_PER_CTA + threadIdx.x;

        __syncthreads(); // Make sure shared memory is ready
        float4 *x_as_float4 = (float4 *)x;
        float4 *y_as_float4 = (float4 *)y;
        
        // Coalesced memory access
        sdata_x[tid] = x_as_float4[idx];
        sdata_y[tid] = y_as_float4[idx];
        
        __syncthreads(); // Ensure all threads have loaded their data

        // Perform SAXPY operation
        float4 result_y;
        result_y.x = a * sdata_x[tid].x + sdata_y[tid].x;
        result_y.y = a * sdata_x[tid].y + sdata_y[tid].y;
        result_y.z = a * sdata_x[tid].z + sdata_y[tid].z;
        result_y.w = a * sdata_x[tid].w + sdata_y[tid].w;

        // Coalesced memory write
        y_as_float4[idx] = result_y;
    }
}