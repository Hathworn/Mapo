#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scaleVector(float *d_res, const float *d_src, float scale, const int len)
{
    // Use shared memory to optimize data access
    __shared__ float cache[256]; // Adjust size according to the blockSize
    const int pos = blockIdx.x * blockDim.x + threadIdx.x;

    if (pos < len) {
        // Load data to shared memory
        cache[threadIdx.x] = d_src[pos];
        __syncthreads();

        // Use data from shared memory
        d_res[pos] = cache[threadIdx.x] * scale;
    }
}