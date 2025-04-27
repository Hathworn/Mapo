#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ResetImage(float* im, int size)
{
    // Calculate the global thread ID more efficiently
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use a stride loop for larger arrays to ensure all elements get reset
    for (int idx = id; idx < size; idx += blockDim.x * gridDim.x) {
        im[idx] = 0;
    }
}