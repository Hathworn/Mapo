#include "hip/hip_runtime.h"
#include "includes.h"

// Lets you use the Cuda FFT library

hipError_t mathWithCuda(float *output, float *input1, float *input2, unsigned int size, int oper);

// Using __global__ to declare function as device code (GPU)
// Do the math inside here:

// Helper function for using CUDA to add vectors in parallel.
__global__ void mathKernel(float *output, float *input1, float *input2, int n, int oper)
{
    // Allocate elements to threads
    int i = threadIdx.x + blockIdx.x * blockDim.x;

    // Avoid access beyond the end of the array
    if (i < n)
    {
        // Simplified operations using conditional statements
        float val1 = input1[i];
        float val2 = input2[i];
        
        if (oper == 1) output[i] = val1 + val2; // Addition
        else if (oper == 2) output[i] = val1 - val2; // Subtraction
        else if (oper == 3) output[i] = val1 * val2; // Multiplication
        else if (oper == 4) output[i] = val1 / val2; // Division
    }
}