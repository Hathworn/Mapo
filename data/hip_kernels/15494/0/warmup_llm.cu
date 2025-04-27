#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void warmup(float *in, float *out, const int nx, const int ny)
{
    // Cache indices to eliminate redundant operations
    unsigned int i = threadIdx.x + blockDim.x * blockIdx.x;
    unsigned int j = threadIdx.y + blockDim.y * blockIdx.y;
    
    // Use shared memory if possible for more efficient data access
    __shared__ float cache[32][32];  // Example size, adjust as needed for your kernel

    if (i < nx && j < ny)
    {
        // Cache the input value to reduce global memory traffic
        cache[threadIdx.y][threadIdx.x] = in[j * nx + i];
        __syncthreads();

        // Write the output value from shared memory
        out[j * nx + i] = cache[threadIdx.y][threadIdx.x];
    }
}