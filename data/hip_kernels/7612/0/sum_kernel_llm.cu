#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sum_kernel(float *g_odata, float *g_idata, int n)
{
    // size determined by the host application
    extern __shared__ float sdata[];

    // access thread id
    const unsigned int tid = threadIdx.x;
    const unsigned int idx = 2 * tid;

    // read input data and reduce collision by making accesses coalesced
    if (idx + 1 < n) {
        sdata[idx] = g_idata[idx];
        sdata[idx + 1] = g_idata[idx + 1];
    } else if (idx < n) {
        sdata[idx] = g_idata[idx];
        sdata[idx + 1] = 0.0f; // handle boundary case
    }

    __syncthreads();

    // perform computations more efficiently
    sdata[idx] += sdata[idx + 1];
    __syncthreads();

    if(tid < n/2) {
        g_odata[tid] = sdata[idx];
    }
}