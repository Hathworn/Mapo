#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void FloorKernel_optimized(const float * A, int Acount, int Acols, float * out0, int out0count)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    // Use grid-stride loop for better parallelism
    for (int i = id; i < out0count; i += blockDim.x * gridDim.x) 
    {
        out0[i] = floor(A[i]);
    }
}