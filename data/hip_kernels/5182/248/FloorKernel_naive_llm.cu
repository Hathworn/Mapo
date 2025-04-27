#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function
__global__ void FloorKernel_optimized(const float * A, int Acount, int Acols, float * out0, int out0count)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x; // Use 1D grid instead of 2D
    int stride = blockDim.x * gridDim.x;            // Calculate stride for processing
    for (int i = id; i < out0count; i += stride)    // Loop to process multiple elements per thread
    {
        out0[i] = floor(A[i]);
    }
}