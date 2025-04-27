#include "hip/hip_runtime.h"
#include "includes.h"

// Improved global kernel function
__global__ void elmult(float *inA, float *inB, int length)
{
    // Calculate unique global thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use grid-stride loop for better performance
    for (int i = idx; i < length; i += blockDim.x * gridDim.x) {
        inA[i] *= inB[i];
    }
}