#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Mask_Invert_Kernel(int* A, int* devOut)
{
    // Calculate the global index
    const int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Load input value to register to reduce global memory accesses
    int input_value = A[idx];

    // Perform computation and store result
    devOut[idx] = 1 - input_value;
}