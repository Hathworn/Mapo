#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void sigmoid32(float* A, int size)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;  // Simplified index calculation for 1D grid and block
    if (idx < size) {  // Adjusted condition for valid index range
        A[idx] = 1.0f / (1.0f + expf(-A[idx]));  // Direct call to expf for better performance
    }
}