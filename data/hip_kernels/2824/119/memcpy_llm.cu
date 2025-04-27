#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void memcpy( float *dst, float *src )
{
    // Calculate initial global index for this thread
    int index = threadIdx.x + 4 * blockIdx.x * blockDim.x;
    
    // Use register allocation to load data from global memory efficiently
    float a0 = src[index];
    float a1 = src[index + blockDim.x];
    float a2 = src[index + 2 * blockDim.x];
    float a3 = src[index + 3 * blockDim.x];

    // Store data back to global memory
    dst[index] = a0;
    dst[index + blockDim.x] = a1;
    dst[index + 2 * blockDim.x] = a2;
    dst[index + 3 * blockDim.x] = a3;
}