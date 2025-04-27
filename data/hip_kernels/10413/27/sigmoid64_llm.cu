#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void sigmoid64(double* A, int size)
{
    // Optimize block and thread index calculation
    int idx = blockIdx.x * blockDim.x + threadIdx.x 
            + blockIdx.y * (blockDim.x * gridDim.x) 
            + blockIdx.z * (blockDim.x * gridDim.x * gridDim.y);
    // Check and process within bounds
    if (idx < size) {
        A[idx] = 1.0 / (1.0 + exp(-A[idx])); // Use exp function for clarity and efficiency
    }
}