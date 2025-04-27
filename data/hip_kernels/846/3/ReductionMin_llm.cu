#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ReductionMin(unsigned int *sdata, unsigned int *results, int n) {
    unsigned int tx = threadIdx.x;

    // Use unrolling for efficient reduction
    for (unsigned int offset = blockDim.x >> 1; offset > 32; offset >>= 1) {
        __syncthreads();
        if (tx < offset) {
            if (sdata[tx + offset] < sdata[tx] || sdata[tx] == 0) {
                sdata[tx] = sdata[tx + offset];
            }
        }
    }

    // Unroll the last warp
    if (tx < 32) {
        volatile unsigned int* vsmem = sdata;
        if (vsmem[tx + 32] < vsmem[tx] || vsmem[tx] == 0) vsmem[tx] = vsmem[tx + 32];
        if (vsmem[tx + 16] < vsmem[tx] || vsmem[tx] == 0) vsmem[tx] = vsmem[tx + 16];
        if (vsmem[tx + 8] < vsmem[tx] || vsmem[tx] == 0) vsmem[tx] = vsmem[tx + 8];
        if (vsmem[tx + 4] < vsmem[tx] || vsmem[tx] == 0) vsmem[tx] = vsmem[tx + 4];
        if (vsmem[tx + 2] < vsmem[tx] || vsmem[tx] == 0) vsmem[tx] = vsmem[tx + 2];
        if (vsmem[tx + 1] < vsmem[tx] || vsmem[tx] == 0) vsmem[tx] = vsmem[tx + 1];
    }

    // Thread 0 writes the result
    if (threadIdx.x == 0) {
        *results = sdata[0];
    }
}