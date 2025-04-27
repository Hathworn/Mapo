#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void one_vector_float(float *vec, const int n)
{
    // Use a single instruction to calculate the index
    unsigned int xIndex = (blockIdx.x * blockDim.x) + threadIdx.x;

    // Check if index is within bounds and assign value using a conditional operator
    if (xIndex < n) { vec[xIndex] = 1.0f; } 
}