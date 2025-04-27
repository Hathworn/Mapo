#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void LogKernel_optimized(const float *A, int Acount, int Acols, float *out0, int out0count)
{
    // Calculate unique global thread ID
    int id = blockIdx.x * blockDim.x + threadIdx.x;

    // Use stride loop to handle more elements per thread and improve data parallelism
    for(int i = id; i < out0count; i += blockDim.x * gridDim.x)
    {
        out0[i] = logf(A[i]); // Use logf for increased performance with single-precision floats
    }
}