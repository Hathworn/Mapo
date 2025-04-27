#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void saxpy_float4s_shmem(float* y, float* x, float a, clock_t* timer_vals) 
{
    // Use float4 for shared memory to load/store data more efficiently.
    __shared__ float4 sdata_x[COMPUTE_THREADS_PER_CTA];
    __shared__ float4 sdata_y[COMPUTE_THREADS_PER_CTA];
    
    int tid = threadIdx.x;

    for (int i = 0; i < NUM_ITERS / 4; i++) {
        unsigned int idx = i * COMPUTE_THREADS_PER_CTA * CTA_COUNT + blockIdx.x * COMPUTE_THREADS_PER_CTA + threadIdx.x;
        
        // Synchronize threads to ensure all data is loaded before proceeding.
        __syncthreads();
        
        // Cast global memory data to float4 and load into shared memory.
        float4* x_as_float4 = (float4*)x;
        float4* y_as_float4 = (float4*)y;
        
        float4 tmp_x = x_as_float4[idx];
        float4 tmp_y = y_as_float4[idx];
        
        // Store into shared memory.
        sdata_x[tid] = tmp_x;
        sdata_y[tid] = tmp_y;
        
        // Synchronize again before doing the computation.
        __syncthreads();
        
        // Perform SAXPY operation with shared memory data.
        float4 result_y;
        result_y.x = a * sdata_x[tid].x + sdata_y[tid].x;
        result_y.y = a * sdata_x[tid].y + sdata_y[tid].y;
        result_y.z = a * sdata_x[tid].z + sdata_y[tid].z;
        result_y.w = a * sdata_x[tid].w + sdata_y[tid].w;
        
        // Store result back to global memory.
        y_as_float4[idx] = result_y;
    }
}