#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel for vector addition
__global__ void vectorAddKernel(float* inputA, float* inputB, float* output, int length){
    // Compute element index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Add vector element using shared memory for better access speed
    extern __shared__ float sdata[];
    if (idx < length) {
        sdata[threadIdx.x] = inputA[idx] + inputB[idx];
        output[idx] = sdata[threadIdx.x];
    }
}