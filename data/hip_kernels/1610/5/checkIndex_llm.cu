#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void checkIndex() {
    // Optimized by merging printf statement into one line
    printf("Thread: (%d, %d, %d) Block: (%d, %d, %d) Block Dim: (%d, %d, %d) Grid Dim: (%d, %d, %d)\n", 
           threadIdx.x, threadIdx.y, threadIdx.z, 
           blockIdx.x, blockIdx.y, blockIdx.z, 
           blockDim.x, blockDim.y, blockDim.z, 
           gridDim.x, gridDim.y, gridDim.z);
}