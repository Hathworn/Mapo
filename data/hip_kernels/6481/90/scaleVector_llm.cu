#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize by using shared memory to reduce global memory access
__global__ void scaleVector(float *d_res, const float *d_src, float scale, const int len)
{
    extern __shared__ float sharedData[];
    const int pos = blockIdx.x * blockDim.x + threadIdx.x;
    const int localIdx = threadIdx.x;

    if (pos < len) {
        // Load data into shared memory
        sharedData[localIdx] = d_src[pos];
        __syncthreads();

        // Perform scaling operation
        d_res[pos] = sharedData[localIdx] * scale;
    }
}