#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void CeilKernel_optimized(const float *A, int Acount, int Acols, float *out0, int out0count)
{
    // Combined calculation for ID to improve performance.
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if (id < out0count)
    {
        out0[id] = ceilf(A[id]); // Use ceilf for better performance with float.
    }
}