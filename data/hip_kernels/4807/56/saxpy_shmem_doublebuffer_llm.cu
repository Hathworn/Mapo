#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void saxpy_shmem_doublebuffer (float* y, float* x, float a, clock_t *timer_vals)
{
    extern __shared__ float sdata[];
    float* sdata_x0 = sdata;
    float* sdata_y0 = sdata + COMPUTE_THREADS_PER_CTA;
    float* sdata_x1 = sdata + 2 * COMPUTE_THREADS_PER_CTA;
    float* sdata_y1 = sdata + 3 * COMPUTE_THREADS_PER_CTA;

    int tid = threadIdx.x;
    unsigned int idx0 = blockIdx.x * COMPUTE_THREADS_PER_CTA + tid;
    unsigned int idx1 = COMPUTE_THREADS_PER_CTA * CTA_COUNT + blockIdx.x * COMPUTE_THREADS_PER_CTA + tid;

    for (int i = 0; i < NUM_ITERS; i += 2) {
        __syncthreads();

        // Load data into shared memory in coalesced manner
        if (tid < COMPUTE_THREADS_PER_CTA) {
            sdata_x0[tid] = x[idx0];
            sdata_y0[tid] = y[idx0];
        }
        __syncthreads();

        if (i != 0) {
            // Perform SAXPY operation and store result
            y[idx1] = a * sdata_x1[tid] + sdata_y1[tid];
            idx1 += 2 * COMPUTE_THREADS_PER_CTA * CTA_COUNT;
        }
        __syncthreads();

        // Load next set of data into shared memory in coalesced manner
        if (tid < COMPUTE_THREADS_PER_CTA) {
            sdata_x1[tid] = x[idx1];
            sdata_y1[tid] = y[idx1];
        }
        __syncthreads();

        // Perform SAXPY operation and store result
        y[idx0] = a * sdata_x0[tid] + sdata_y0[tid];
        idx0 += 2 * COMPUTE_THREADS_PER_CTA * CTA_COUNT;
    }

    __syncthreads();
    // Final write-back for last iteration
    y[idx1] = a * sdata_x1[tid] + sdata_y1[tid];
}