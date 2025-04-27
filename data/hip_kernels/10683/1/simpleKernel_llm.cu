#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void simpleKernel(float *dst, float *src)
{
    // Use shared memory for better memory access efficiency
    __shared__ float shared_src[256]; // Assuming blockDim.x is 256

    // Load data into shared memory
    const int idx = blockIdx.x * blockDim.x + threadIdx.x;
    shared_src[threadIdx.x] = src[idx];
    __syncthreads();

    // Calculate square using shared memory
    float temp = shared_src[threadIdx.x];
    dst[idx] = temp * temp;
}