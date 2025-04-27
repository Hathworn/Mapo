#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void saxpy_float4s_shmem_doublebuffer (float* y, float* x, float a, clock_t * timer_vals) {
    __shared__ float4 sdata_x0_0[COMPUTE_THREADS_PER_CTA];
    __shared__ float4 sdata_y0_0[COMPUTE_THREADS_PER_CTA];
    __shared__ float4 sdata_x0_1[COMPUTE_THREADS_PER_CTA];
    __shared__ float4 sdata_y0_1[COMPUTE_THREADS_PER_CTA];

    int tid = threadIdx.x;
    unsigned int idx0 = blockIdx.x * COMPUTE_THREADS_PER_CTA + tid;
    unsigned int idx1 = COMPUTE_THREADS_PER_CTA * CTA_COUNT + blockIdx.x * COMPUTE_THREADS_PER_CTA + tid;

    float4 *x_as_float4 = (float4 *)x;
    float4 *y_as_float4 = (float4 *)y;
    float4 result_y;

    for (int i = 0; i < NUM_ITERS / 4; i += 2) {
        __syncthreads();
        float4 tmp1_x = x_as_float4[idx0];
        float4 tmp1_y = y_as_float4[idx0];

        if (i != 0) {
            result_y.x = a * sdata_x0_1[tid].x + sdata_y0_1[tid].x;
            result_y.y = a * sdata_x0_1[tid].y + sdata_y0_1[tid].y;
            result_y.z = a * sdata_x0_1[tid].z + sdata_y0_1[tid].z;
            result_y.w = a * sdata_x0_1[tid].w + sdata_y0_1[tid].w;
            y_as_float4[idx1] = result_y;
            idx1 += 2 * COMPUTE_THREADS_PER_CTA * CTA_COUNT;
        }

        sdata_x0_0[tid] = tmp1_x;
        sdata_y0_0[tid] = tmp1_y;
        __syncthreads();

        float4 tmp2_x = x_as_float4[idx1];
        float4 tmp2_y = y_as_float4[idx1];

        result_y.x = a * sdata_x0_0[tid].x + sdata_y0_0[tid].x;
        result_y.y = a * sdata_x0_0[tid].y + sdata_y0_0[tid].y;
        result_y.z = a * sdata_x0_0[tid].z + sdata_y0_0[tid].z;
        result_y.w = a * sdata_x0_0[tid].w + sdata_y0_0[tid].w;
        y_as_float4[idx0] = result_y;
        idx0 += 2 * COMPUTE_THREADS_PER_CTA * CTA_COUNT;

        sdata_x0_1[tid] = tmp2_x;
        sdata_y0_1[tid] = tmp2_y;
    }

    __syncthreads();
    result_y.x = a * sdata_x0_1[tid].x + sdata_y0_1[tid].x;
    result_y.y = a * sdata_x0_1[tid].y + sdata_y0_1[tid].y;
    result_y.z = a * sdata_x0_1[tid].z + sdata_y0_1[tid].z;
    result_y.w = a * sdata_x0_1[tid].w + sdata_y0_1[tid].w;
    y_as_float4[idx1] = result_y;
}