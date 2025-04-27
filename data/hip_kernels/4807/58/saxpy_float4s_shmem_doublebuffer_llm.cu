```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void saxpy_float4s_shmem_doublebuffer(float* y, float* x, float a, clock_t* timer_vals) {
    // Use float4 for shared memory to improve coalescence
    extern __shared__ float4 shared_mem[];
    float4* sdata_x0 = shared_mem;
    float4* sdata_x1 = shared_mem + COMPUTE_THREADS_PER_CTA;

    int tid = threadIdx.x;
    unsigned int idx0 = blockIdx.x * COMPUTE_THREADS_PER_CTA + tid;
    unsigned int idx1 = COMPUTE_THREADS_PER_CTA * CTA_COUNT + blockIdx.x * COMPUTE_THREADS_PER_CTA + tid;

    float4* x_as_float4 = (float4*)x;
    float4* y_as_float4 = (float4*)y;
    float4 result_y;

    for (int i = 0; i < NUM_ITERS / 4; i += 2) {
        __syncthreads();
        float4 tmp1_x = x_as_float4[idx0];
        float4 tmp1_y = y_as_float4[idx0];

        if (i != 0) {
            result_y.x = a * sdata_x1[tid].x + sdata_x1[tid].y;
            result_y.y = a * sdata_x1[tid].z + sdata_x1[tid].w;
            result_y.z = a * sdata_x1[tid].x + sdata_x1[tid].y;
            result_y.w = a * sdata_x1[tid].z + sdata_x1[tid].w;
            y_as_float4[idx1] = result_y;
            idx1 += 2 * COMPUTE_THREADS_PER_CTA * CTA_COUNT;
        }

        // Store float4 to shared memory directly
        sdata_x0[tid] = tmp1_x;
        __syncthreads();

        tmp1_x = x_as_float4[idx1];
        tmp1_y = y_as_float4[idx1];
        
        result_y.x = a * sdata_x0[tid].x + sdata_x0[tid].y;
        result_y.y = a * sdata_x0[tid].z + sdata_x0[tid].w;
        result_y.z = a * sdata_x0[tid].x + sdata_x0[tid].y;
        result_y.w = a * sdata_x0[tid].z + sdata_x0[tid].w;
        
        y_as_float4[idx0] = result_y;
        idx0 += 2 * COMPUTE_THREADS_PER_CTA * CTA_COUNT;
        
        sdata_x1[tid] = tmp1_x; // Use second buffer for next iteration
    }
    
    __syncthreads();
    // Final writeback in case loop ends before updating idx1
    result_y.x = a * sdata_x1[tid].x + sdata_x1[tid].y;
    result_y.y = a * sdata_x1[tid].z + sdata_x1[tid].w;
    result_y.z = a * sdata_x1[tid].x + sdata_x1[tid].y;
    result_y.w = a * sdata_x1[tid].z + sdata_x1[tid].w;
    
    y_as_float4[idx1] = result_y;
}