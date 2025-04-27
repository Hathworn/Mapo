#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reciprocalKernel(float *data, unsigned vectorSize) {
    unsigned idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Use shared memory to improve memory access latency
    __shared__ float cache[256];  // Assuming blockDim.x is 256
    if (idx < vectorSize) {
        cache[threadIdx.x] = data[idx];
        __syncthreads();
        data[idx] = 1.0 / cache[threadIdx.x];
    }
}