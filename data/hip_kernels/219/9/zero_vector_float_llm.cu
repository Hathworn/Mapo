#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void zero_vector_float(float *vec, const int n)
{
    // Calculate global thread index
    unsigned int xIndex = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure the index is within bounds
    if (xIndex < n)
    {
        vec[xIndex] = 0.0f; // Set the vector element to zero
    }
}