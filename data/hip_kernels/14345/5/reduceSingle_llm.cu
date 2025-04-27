#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reduceSingle(int *idata, int *single, int nrows)
{
    extern __shared__ int parts[];

    // Initialize shared memory
    int sum = 0;
    for (int i = threadIdx.x; i < nrows; i += blockDim.x) {
        sum += idata[i];
    }
    parts[threadIdx.x] = sum;
    __syncthreads();

    // Optimize sum reduction using loop unrolling
    for (int stride = blockDim.x / 2; stride > 32; stride >>= 1) {
        if (threadIdx.x < stride) {
            parts[threadIdx.x] += parts[threadIdx.x + stride];
        }
        __syncthreads();
    }

    // Unrolling the last warp
    if (threadIdx.x < 32) {
        volatile int *vparts = parts;
        vparts[threadIdx.x] += vparts[threadIdx.x + 32];
        vparts[threadIdx.x] += vparts[threadIdx.x + 16];
        vparts[threadIdx.x] += vparts[threadIdx.x + 8];
        vparts[threadIdx.x] += vparts[threadIdx.x + 4];
        vparts[threadIdx.x] += vparts[threadIdx.x + 2];
        vparts[threadIdx.x] += vparts[threadIdx.x + 1];
    }

    // Only the first thread writes the result
    if (threadIdx.x == 0) {
        *single = parts[0];
    }
}