#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function
__global__ void checkIndex(void) {
    // Calculate global thread index in 1D
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx == 0) { // Ensure only one thread performs printf
        printf("threadIdx:(%d, %d, %d) blockIdx:(%d, %d, %d) blockDim:(%d, %d, %d) "
               "gridDim:(%d, %d, %d)\n",
               threadIdx.x, threadIdx.y, threadIdx.z,
               blockIdx.x, blockIdx.y, blockIdx.z,
               blockDim.x, blockDim.y, blockDim.z,
               gridDim.x, gridDim.y, gridDim.z);
    }
}