#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void checkIndex(void)
{
    // Compute once, reuse in prints for efficiency
    int thx = threadIdx.x, thy = threadIdx.y, thz = threadIdx.z;
    int blx = blockIdx.x, bly = blockIdx.y, blz = blockIdx.z;

    // Consolidated prints to one line for conciseness and less overhead
    printf("threadIdx:(%d, %d, %d), blockIdx:(%d, %d, %d)\n", thx, thy, thz, blx, bly, blz);
    printf("blockDim:(%d, %d, %d), gridDim:(%d, %d, %d)\n", blockDim.x, blockDim.y, blockDim.z, gridDim.x, gridDim.y, gridDim.z);
}