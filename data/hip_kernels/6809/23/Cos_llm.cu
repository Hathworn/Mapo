#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Cos(float *x, size_t idx, size_t N, float W0)
{
    // Calculate the global index of the thread
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure the thread works on elements within bounds
    if (i < N)
    {
        x[(idx-1)*N+i] = cos(W0 * x[(idx-1)*N+i]);
    }
}