#include "hip/hip_runtime.h"
#include "includes.h"

// Use __restrict__ to hint compiler for no aliasing
__global__ void cuda_hello() {
    // Compute global thread index for efficiency
    int globalIdx = blockIdx.x * blockDim.x + threadIdx.x;
    printf("Hello from GPU globalIdx=%d blockIdx.x=%d blockIdx.y=%d blockIdx.z=%d threadIdx.x=%d threadIdx.y=%d threadIdx.z=%d\n", globalIdx, blockIdx.x, blockIdx.y, blockIdx.z, threadIdx.x, threadIdx.y, threadIdx.z);
}