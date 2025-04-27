#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize kernel with shared memory
__global__ void threshKernel(unsigned char * image, unsigned char* moddedimage, int size, int threshold)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Launch more threads than necessary to check bounds
    if (i >= size) return;

    // Use conditional operator for a concise threshold operation
    moddedimage[i] = (image[i] > threshold) ? 255 : 0;
}