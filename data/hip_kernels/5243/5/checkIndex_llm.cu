#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void checkIndex(void) {
    // Simplified printf by grouping the kernel attributes into a single statement
    printf("threadIdx:(%d, %d, %d) blockIdx:(%d, %d, %d) "
           "blockDim:(%d, %d, %d) gridDim:(%d, %d, %d)\n", 
           threadIdx.x, threadIdx.y, threadIdx.z,
           blockIdx.x, blockIdx.y, blockIdx.z, 
           blockDim.x, blockDim.y, blockDim.z,
           gridDim.x, gridDim.y, gridDim.z);
}