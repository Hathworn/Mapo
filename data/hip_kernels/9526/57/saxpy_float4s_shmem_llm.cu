#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void saxpy_float4s_shmem(float* y, float* x, float a, clock_t * timer_vals)
{
    extern __shared__ float sdata[]; // Use a single shared memory array
    float* sdata_x = sdata; // Pointer for X shared memory
    float* sdata_y = sdata + COMPUTE_THREADS_PER_CTA * 4; // Pointer for Y shared memory

    int tid = threadIdx.x;

    for (int i = 0; i < NUM_ITERS / 4; i++)
    {
        unsigned int idx = i * COMPUTE_THREADS_PER_CTA * CTA_COUNT + blockIdx.x * COMPUTE_THREADS_PER_CTA + threadIdx.x;

        __syncthreads();
        float4* x_as_float4 = (float4*)x;
        float4* y_as_float4 = (float4*)y;
        float4 tmp1_x, tmp1_y;
        tmp1_x = x_as_float4[idx];
        tmp1_y = y_as_float4[idx];

        // Use a single array for shared memory
        sdata_x[tid] = tmp1_x.x;
        sdata_x[tid + COMPUTE_THREADS_PER_CTA] = tmp1_x.y;
        sdata_x[tid + 2 * COMPUTE_THREADS_PER_CTA] = tmp1_x.z;
        sdata_x[tid + 3 * COMPUTE_THREADS_PER_CTA] = tmp1_x.w;
        sdata_y[tid] = tmp1_y.x;
        sdata_y[tid + COMPUTE_THREADS_PER_CTA] = tmp1_y.y;
        sdata_y[tid + 2 * COMPUTE_THREADS_PER_CTA] = tmp1_y.z;
        sdata_y[tid + 3 * COMPUTE_THREADS_PER_CTA] = tmp1_y.w;
        __syncthreads();

        float4 result_y;
        result_y.x = a * sdata_x[tid] + sdata_y[tid];
        result_y.y = a * sdata_x[tid + COMPUTE_THREADS_PER_CTA] + sdata_y[tid + COMPUTE_THREADS_PER_CTA];
        result_y.z = a * sdata_x[tid + 2 * COMPUTE_THREADS_PER_CTA] + sdata_y[tid + 2 * COMPUTE_THREADS_PER_CTA];
        result_y.w = a * sdata_x[tid + 3 * COMPUTE_THREADS_PER_CTA] + sdata_y[tid + 3 * COMPUTE_THREADS_PER_CTA];
        y_as_float4[idx] = result_y;
    }
}