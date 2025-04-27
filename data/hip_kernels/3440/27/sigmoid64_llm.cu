#include "hip/hip_runtime.h" 
#include "includes.h"

__global__ void sigmoid64(double* A, int size) 
{
    // Optimize index calculation and simplify block id computation
    int idx = blockIdx.x * blockDim.x * blockDim.y * blockDim.z + threadIdx.z * blockDim.x * blockDim.y + threadIdx.y * blockDim.x + threadIdx.x;

    if (idx < size) {
        // Use intrinsics for better performance
        A[idx] = 1.0 / (1.0 + exp(-A[idx]));
    }
}