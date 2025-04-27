#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vectorAddKernel(float* A, float* B, float* Result) {
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Load data from global memory to registers (if needed for extra optimization)
    float a = A[i];
    float b = B[i];
    
    // Perform addition
    float result = a + b;
    
    // Write result back to global memory
    Result[i] = result;
}