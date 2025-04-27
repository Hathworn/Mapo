#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void iReduceSingle2(int *idata, int *single, unsigned int ncols) {
    unsigned int tid = threadIdx.x;
    extern __shared__ int sdata[];
    unsigned int startPos = tid * (ncols / blockDim.x);  // Updated to ensure evenly distributed work
    int myPart = 0;
    
    // Use loop unrolling for improved memory throughput
    int step = ncols / blockDim.x;
    for (int i = startPos; i < startPos + step; i += 4) {
        if (i < ncols) myPart += idata[i];
        if (i + 1 < ncols) myPart += idata[i + 1];
        if (i + 2 < ncols) myPart += idata[i + 2];
        if (i + 3 < ncols) myPart += idata[i + 3];
    }
    
    sdata[tid] = myPart;
    __syncthreads();

    // Optimized reduction with warp divergence minimization
    for (unsigned int s = blockDim.x / 2; s > 0; s >>= 1) {
        if (tid < s) {
            sdata[tid] += sdata[tid + s];
        }
        __syncthreads();
    }

    if (tid == 0) *single = sdata[0];
}
```
