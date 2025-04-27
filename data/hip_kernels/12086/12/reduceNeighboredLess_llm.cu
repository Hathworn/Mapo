#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reduceNeighboredLess(int *g_idata, int *g_odata, unsigned int n) {
    // Set thread ID
    unsigned int tid = threadIdx.x;
    unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Convert global data pointer to the local pointer of this block
    int *idata = g_idata + blockIdx.x * blockDim.x;

    // Boundary check
    if (idx >= n) return;

    // Intra-block reduction using shared memory
    __shared__ int sdata[1024];  // Assuming blockDim.x <= 1024
    sdata[tid] = idata[tid];
    __syncthreads();

    // In-place reduction
    for (unsigned int stride = blockDim.x / 2; stride > 0; stride >>= 1) {
        if (tid < stride) {
            sdata[tid] += sdata[tid + stride];
        }
        __syncthreads();
    }

    // Write result for this block to global memory
    if (tid == 0) g_odata[blockIdx.x] = sdata[0];
}
```
