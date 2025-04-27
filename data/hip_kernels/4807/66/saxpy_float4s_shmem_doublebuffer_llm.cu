#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void saxpy_float4s_shmem_doublebuffer(float* y, float* x, float a, clock_t *timer_vals)
{
    // Use a single shared memory buffer with 2 float4 arrays for double buffering
    extern __shared__ float4 sdata[];
    float4 *sdata_x_0 = sdata;
    float4 *sdata_y_0 = sdata + COMPUTE_THREADS_PER_CTA;
    float4 *sdata_x_1 = sdata + 2 * COMPUTE_THREADS_PER_CTA;
    float4 *sdata_y_1 = sdata + 3 * COMPUTE_THREADS_PER_CTA;
    
    int tid = threadIdx.x;
    unsigned int idx0 = blockIdx.x * COMPUTE_THREADS_PER_CTA + tid;
    unsigned int idx1 = COMPUTE_THREADS_PER_CTA * CTA_COUNT + blockIdx.x * COMPUTE_THREADS_PER_CTA + tid;
    
    float4 *x_as_float4 = (float4 *)x;
    float4 *y_as_float4 = (float4 *)y;
    float4 result_y;
    
    for (int i = 0; i < NUM_ITERS / 4; i += 2) {
        // Load x and y to shared memory
        float4 tmp1_x = x_as_float4[idx0];
        float4 tmp1_y = y_as_float4[idx0];
        
        __syncthreads();
        
        if (i != 0) {
            // Compute and store result from previous iteration
            result_y.x = a * sdata_x_1[tid].x + sdata_y_1[tid].x;
            result_y.y = a * sdata_x_1[tid].y + sdata_y_1[tid].y;
            result_y.z = a * sdata_x_1[tid].z + sdata_y_1[tid].z;
            result_y.w = a * sdata_x_1[tid].w + sdata_y_1[tid].w;
            y_as_float4[idx1] = result_y;
            idx1 += 2 * COMPUTE_THREADS_PER_CTA * CTA_COUNT;
        }
        
        sdata_x_0[tid] = tmp1_x;
        sdata_y_0[tid] = tmp1_y;
        
        __syncthreads();
        
        // Process next set of data
        tmp1_x = x_as_float4[idx1];
        tmp1_y = y_as_float4[idx1];
        result_y.x = a * sdata_x_0[tid].x + sdata_y_0[tid].x;
        result_y.y = a * sdata_x_0[tid].y + sdata_y_0[tid].y;
        result_y.z = a * sdata_x_0[tid].z + sdata_y_0[tid].z;
        result_y.w = a * sdata_x_0[tid].w + sdata_y_0[tid].w;
        y_as_float4[idx0] = result_y;
        idx0 += 2 * COMPUTE_THREADS_PER_CTA * CTA_COUNT;
        
        sdata_x_1[tid] = tmp1_x;
        sdata_y_1[tid] = tmp1_y;
    }
    
    __syncthreads();
    // Final computation for leftover data
    result_y.x = a * sdata_x_1[tid].x + sdata_y_1[tid].x;
    result_y.y = a * sdata_x_1[tid].y + sdata_y_1[tid].y;
    result_y.z = a * sdata_x_1[tid].z + sdata_y_1[tid].z;
    result_y.w = a * sdata_x_1[tid].w + sdata_y_1[tid].w;
    y_as_float4[idx1] = result_y;
}