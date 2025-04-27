#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reduce(float *gdata, float *out, size_t n) {
    __shared__ float sdata[BLOCK_SIZE];
    int tid = threadIdx.x;
    int blockSize = blockDim.x;  // Cache blockDim.x to a local variable for reuse
    size_t idx = threadIdx.x + blockSize * blockIdx.x;

    float myMax = -FLT_MAX;  // Initialize with smallest possible float value

    // Grid stride loop to load data
    while (idx < n) {
        myMax = max(gdata[idx], myMax);
        idx += gridDim.x * blockSize;
    }
    sdata[tid] = myMax;  // Write to shared memory

    __syncthreads();
    // Parallel reduction in shared memory
    for (unsigned int s = blockSize / 2; s > 0; s >>= 1) {
        if (tid < s) {
            sdata[tid] = max(sdata[tid + s], sdata[tid]);
        }
        __syncthreads();
    }
    // Write result for this block to global memory
    if (tid == 0) out[blockIdx.x] = sdata[0];
}