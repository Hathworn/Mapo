#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ReduceRowMajor2(int *g_idata, int *g_odata, int size) {
    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int tid = threadIdx.x;
    extern __shared__ int sdata[];

    // Initialize shared memory
    sdata[tid] = (i < size) ? g_idata[i] : 0;
    __syncthreads();

    // Perform unrolled reduction
    for (unsigned int s = 4; s < blockDim.x; s *= 2) {
        int index = 2 * s * tid;
        if (index < blockDim.x) {
            // Fully unroll loop for s = 4
            int idx1 = index + s;
            int idx2 = index + s + 1;
            int idx3 = index + s + 2;
            int idx4 = index + s + 3;
            
            sdata[index] += sdata[idx1];
            sdata[index + 1] += sdata[idx2];
            sdata[index + 2] += sdata[idx3];
            sdata[index + 3] += sdata[idx4];
        }
        __syncthreads();
    }

    // Write result to global memory
    if (tid == 0) {
        g_odata[blockIdx.x * 4] = sdata[0];
        g_odata[blockIdx.x * 4 + 1] = sdata[1];
        g_odata[blockIdx.x * 4 + 2] = sdata[2];
        g_odata[blockIdx.x * 4 + 3] = sdata[3];
    }
}