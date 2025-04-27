#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void vecMultiplyReverse(int *A, int *B, int *C)
{
    // Calculate global index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use ternary operator for concise condition handling
    C[i] = (i % 2 == 0) ? (A[i] + B[i]) : (A[i] - B[i]);
}