```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void If(bool * xb, float * xf, size_t idxf, size_t idxb, size_t N)
{
    // Calculate global index once to avoid recalculating in the loop
    int globalIdx = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;

    for (int i = globalIdx; i < N; i += stride)
    {
        // Use shared memory or registers if more complex computation is needed
        if (!xb[(idxb-1)*N+i])
            xf[(idxf-1)*N+i] = 0;
    }
}