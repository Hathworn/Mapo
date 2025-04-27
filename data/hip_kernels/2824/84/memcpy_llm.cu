#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void memcpy( float *dst, float *src )
{
    // Calculate index based on block and thread
    int index = threadIdx.x + 4 * blockIdx.x * blockDim.x;
    
    // Use register allocation for optimal memory access
    float a[4];
    
    // Loop unrolling for loading and storing operations
    a[0] = src[index];
    a[1] = src[index + blockDim.x];
    a[2] = src[index + 2 * blockDim.x];
    a[3] = src[index + 3 * blockDim.x];
    
    dst[index] = a[0];
    dst[index + blockDim.x] = a[1];
    dst[index + 2 * blockDim.x] = a[2];
    dst[index + 3 * blockDim.x] = a[3];
}