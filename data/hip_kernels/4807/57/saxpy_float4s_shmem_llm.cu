#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void saxpy_float4s_shmem (float* y, float* x, float a, clock_t * timer_vals)
{
    // Use float4 shared memory to utilize vectorized operations 
    extern __shared__ float4 sdata[];

    int tid = threadIdx.x;

    for (int i = 0; i < NUM_ITERS / 4; i++) {
        unsigned int idx = i * COMPUTE_THREADS_PER_CTA * CTA_COUNT + blockIdx.x * COMPUTE_THREADS_PER_CTA + threadIdx.x;

        // Sync threads before loading data to shared memory
        __syncthreads();

        float4* x_as_float4 = (float4*)x;
        float4* y_as_float4 = (float4*)y;
        
        // Load x and y into shared memory using float4
        sdata[tid] = x_as_float4[idx];
        float4 tmp1_y = y_as_float4[idx];

        // Sync threads to ensure all data is loaded
        __syncthreads();

        // Perform computation using shared memory
        float4 result_y;
        result_y.x = a * sdata[tid].x + tmp1_y.x;
        result_y.y = a * sdata[tid].y + tmp1_y.y;
        result_y.z = a * sdata[tid].z + tmp1_y.z;
        result_y.w = a * sdata[tid].w + tmp1_y.w;

        // Store result
        y_as_float4[idx] = result_y;
    }
}