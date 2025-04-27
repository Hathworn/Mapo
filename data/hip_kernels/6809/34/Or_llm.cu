#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void Or(bool * x, size_t idx, size_t N)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;
    
    for (; i < N; i += stride)
    {
        // Optimize memory access with logical operation
        x[(idx-2)*N+i] |= x[(idx-1)*N+i];
    }
}