#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void FillOnes(float *vec, int size)
{
    // Calculate unique thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure index is within bounds
    if (idx < size) {
        vec[idx] = 1.0f; // Initialize to 1.0f
    }
}