#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sigmoid32(float* A, int size)
{
    // Optimize grid stride loop for better occupancy and scalability
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;
    
    for (; idx < size; idx += stride) {
        A[idx] = 1.0f / (1.0f + expf(-A[idx])); // Use expf for improved performance
    }
}