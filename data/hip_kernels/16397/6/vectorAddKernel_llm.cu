```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void vectorAddKernel(float* A, float* B, float* Result) {
    // Calculate global index for the current thread
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Improve memory coalescing by loading inputs to registers
    float regA = A[i];
    float regB = B[i];

    // Perform the subtraction and store result in register before writing to global memory
    Result[i] = regA - regB;
}