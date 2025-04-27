#include "hip/hip_runtime.h"
#include "includes.h"

// CUDA-C includes

extern "C" void runCudaPart();

// Optimized kernel function
__global__ void addAry(int *ary1, int *ary2)
{
    int indx = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global index
    ary1[indx] += ary2[indx]; // Perform addition at global index
}