#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void LogKernel_optimized(const float *A, int Acount, int Acols, float *out0, int out0count)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x; // Simplified index calculation
    
    // Check bounds for valid threads only
    if (idx < out0count)
    {
        out0[idx] = logf(A[idx]); // Use logf for faster computation with float
    }
}