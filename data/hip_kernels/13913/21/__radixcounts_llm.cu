#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void __radixcounts(float *a, int n, int digit, unsigned int *bi) {
    __shared__ unsigned int ic[RNDVALS];

    int istart = blockIdx.x * n / gridDim.x;
    int iend = (blockIdx.x + 1) * n / gridDim.x;
    int tid = threadIdx.x;
    int bibase = RNDVALS * (blockIdx.x + istart / RBIGBLK);

    for (int i = istart; i < iend; i += RBIGBLK) {
        // Initialize shared memory
        ic[tid] = 0;
        __syncthreads();

        for (int j = i + tid; j < min(iend, i + RBIGBLK); j += RNTHREADS) {
            float v = a[j];
            unsigned char *cv = (unsigned char *)&v;
            // Use atomicAdd as atomicInc might not be suitable for incrementation
            atomicAdd(&ic[cv[digit]], 1);
        }
        __syncthreads();

        // Write back results from shared memory to global memory
        bi[bibase + tid] = ic[tid];
        bibase += RNDVALS;
    }
}