#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void RoundKernel_optimized(const float *A, int Acount, int Acols, float *out0, int out0count)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x; // Simplified thread ID calculation
    if (id < out0count)
    {
        out0[id] = roundf(A[id]); // Use faster roundf function for float
    }
}