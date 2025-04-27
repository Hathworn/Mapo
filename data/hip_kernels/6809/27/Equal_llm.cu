#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Equal(float * xf, bool * xb, size_t idxf, size_t idxb, size_t N)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Unroll loop to improve performance
    if (i < N)
    {
        xb[(idxb)*N + i] = xf[(idxf-1)*N + i] == xf[(idxf-2)*N + i];
    }
}