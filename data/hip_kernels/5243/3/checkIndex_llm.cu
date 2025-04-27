```c
#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel for checking thread and block indices
__global__ void checkIndex(void) {
    // Compute global thread index for better dimensional check
    int globalId = blockIdx.x * blockDim.x + threadIdx.x;

    // Only thread with a specific globalId performs the print operation
    if(globalId == 0) {
        printf("threadIdx:(%d, %d, %d) blockIdx:(%d, %d, %d) blockDim:(%d, %d, %d) "
               "gridDim:(%d, %d, %d)\n", threadIdx.x, threadIdx.y, threadIdx.z,
               blockIdx.x, blockIdx.y, blockIdx.z, blockDim.x, blockDim.y, blockDim.z,
               gridDim.x, gridDim.y, gridDim.z);
    }
}