#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void CeilKernel_naive(const float *A, int Acount, int Acols, float *out0, int out0count)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x; // Simplified id calculation
    int stride = blockDim.x * gridDim.x;            // Calculate stride for grid-stride loop
    for (int i = id; i < out0count; i += stride)    // Use grid-stride loop to process elements
    {
        out0[i] = ceil(A[i]);
    }
}