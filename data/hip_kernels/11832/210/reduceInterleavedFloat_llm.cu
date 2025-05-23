#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reduceInterleavedFloat (float *g_idata, float *g_odata, unsigned int n) {
    // set thread ID
    unsigned int tid = threadIdx.x;
    unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // convert global data pointer to the local pointer of this block
    float *idata = g_idata + blockIdx.x * blockDim.x;

    // boundary check
    if (idx >= n) return;

    // in-place reduction in global memory
    for (int stride = blockDim.x / 2; stride > 0; stride >>= 1) {
        // Avoid redundant synchronization by skipping threads that can't reach the next stride
        if (tid < stride) {
            idata[tid] += idata[tid + stride];
        }
        // Synchronize at only necessary strides
        if (stride > warpSize) {
            __syncthreads();
        }
    }

    // write result for this block to global mem
    if (tid == 0) g_odata[blockIdx.x] = idata[0];
}