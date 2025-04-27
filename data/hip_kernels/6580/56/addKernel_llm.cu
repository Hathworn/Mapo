#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void addKernel(float* A, int size) {
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Check if the ID is within bounds
    if (id >= size) return;

    // Perform addition
    A[id] += 1;
}