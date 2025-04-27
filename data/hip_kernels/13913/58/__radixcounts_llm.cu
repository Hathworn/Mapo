#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void __radixcounts(double *a, int n, int digit, unsigned int *bi) {
    __shared__ unsigned int ic[RNDVALS];

    // Calculate the range of data each block is responsible for
    int istart = ((long long)blockIdx.x * n) / gridDim.x;
    int iend = ((long long)(blockIdx.x + 1) * n) / gridDim.x;
    int tid = threadIdx.x;
    int bibase = RNDVALS * (blockIdx.x + istart / RBIGBLK);

    for (int i = istart; i < iend; i += RBIGBLK) {
        __syncthreads();
        ic[tid] = 0;  // Initialize shared memory
        __syncthreads();

        // Efficiently loop through elements with strided access pattern
        for (int j = i + tid; j < min(iend, i + RBIGBLK); j += blockDim.x) {
            double v = a[j];
            unsigned char *cv = (unsigned char *)&v;
            atomicInc(&ic[cv[digit]], 65536 * 32767);
        }
        __syncthreads();

        // Store results back to global memory
        bi[bibase + tid] = ic[tid];
        bibase += RNDVALS;
    }
}