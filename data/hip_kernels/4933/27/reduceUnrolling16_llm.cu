#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reduceUnrolling16(int *g_idata, int *g_odata, unsigned int n) {
    // set thread ID
    unsigned int tid = threadIdx.x;
    unsigned int idx = blockIdx.x * blockDim.x * 16 + tid;
    
    // convert global data pointer to the local pointer of this block
    int *idata = g_idata + blockIdx.x * blockDim.x * 16;
    
    // unrolling 16 with shared memory optimization
    __shared__ int sdata[256]; // use shared memory to reduce global reads
    int localSum = 0;

    if (idx + 15 * blockDim.x < n) {
        localSum = g_idata[idx] + g_idata[idx + blockDim.x] 
                 + g_idata[idx + 2 * blockDim.x] + g_idata[idx + 3 * blockDim.x]
                 + g_idata[idx + 4 * blockDim.x] + g_idata[idx + 5 * blockDim.x]
                 + g_idata[idx + 6 * blockDim.x] + g_idata[idx + 7 * blockDim.x]
                 + g_idata[idx + 8 * blockDim.x] + g_idata[idx + 9 * blockDim.x]
                 + g_idata[idx + 10 * blockDim.x] + g_idata[idx + 11 * blockDim.x]
                 + g_idata[idx + 12 * blockDim.x] + g_idata[idx + 13 * blockDim.x]
                 + g_idata[idx + 14 * blockDim.x] + g_idata[idx + 15 * blockDim.x];
    }
    sdata[tid] = localSum;
    __syncthreads();

    // in-place reduction in shared memory
    for (int stride = blockDim.x / 2; stride > 0; stride >>= 1) {
        if (tid < stride) {
            sdata[tid] += sdata[tid + stride];
        }
        __syncthreads(); // synchronize within threadblock
    }
    
    // write result for this block to global mem
    if (tid == 0) g_odata[blockIdx.x] = sdata[0];
}