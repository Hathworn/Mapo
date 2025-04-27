#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reduceUnrolling8New(int *g_idata, int *g_odata, unsigned int n)
{
    // Set thread ID
    unsigned int tid = threadIdx.x;
    unsigned int idx = blockIdx.x * blockDim.x * 8 + threadIdx.x;

    // Convert global data pointer to the local pointer of this block
    int *idata = g_idata + blockIdx.x * blockDim.x * 8;

    // Unrolling 8 with bounds checking
    int tmp = 0;
    if (idx + 7 * blockDim.x < n) {
        int *ptr = g_idata + idx;

        // Increment tmp 8 times with values strided by blockDim.x
        #pragma unroll // Unroll the loop for performance
        for (int i = 0; i < 8; i++) {
            tmp += *ptr;
            ptr += blockDim.x;
        }

        idata[tid] = tmp; // Store result in shared memory
    } else if (idx < n) {
        idata[tid] = g_idata[idx]; // Handle remaining elements
    } else {
        idata[tid] = 0; // Avoid uninitialized memory
    }

    __syncthreads();

    // In-place reduction in shared memory
    for (int stride = blockDim.x / 2; stride > 0; stride >>= 1) {
        if (tid < stride) {
            idata[tid] += idata[tid + stride];
        }
        __syncthreads();
    }

    // Write result for this block to global memory
    if (tid == 0) g_odata[blockIdx.x] = idata[0];
}