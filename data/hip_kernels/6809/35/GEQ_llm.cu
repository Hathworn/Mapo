#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void GEQ(float * xf, bool * xb, size_t idxf, size_t idxb, size_t N)
{
    // Calculate global thread ID
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use stride to ensure each thread processes multiple elements if necessary
    int stride = blockDim.x * gridDim.x;

    // Loop over elements with stride for efficient memory access
    for (; i < N; i += stride)
    {
        xb[idxb*N+i] = xf[(idxf-1)*N+i] >= xf[(idxf-2)*N+i];
    }
}