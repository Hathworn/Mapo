#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sigmoid32(float* A, int size)
{
    // Combine grid and block calculations for better readability and potential optimization
    int idx = blockIdx.x * blockDim.x + threadIdx.x + 
              (blockIdx.y * blockDim.y + threadIdx.y) * gridDim.x * blockDim.x + 
              (blockIdx.z * blockDim.z + threadIdx.z) * gridDim.x * gridDim.y * blockDim.x * blockDim.y;

    if (idx < size) {
        // Use expf directly for better performance
        A[idx] = 1.0f / (1.0f + expf(-A[idx]));
    }
}