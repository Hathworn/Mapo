#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void Add(float * x, size_t idx, size_t N, float W0, float W1)
{
    // Optimize thread stride loop to avoid repeated arithmetic calculations
    int i = blockIdx.x * blockDim.x + threadIdx.x; 
    int step = blockDim.x * gridDim.x;
    int offset1 = (idx-1) * N;
    int offset2 = (idx-2) * N;

    for (; i < N; i += step)
    {
        // Reduce the array index calculation inside the loop
        x[offset2 + i] = x[offset1 + i] * W0 + x[offset2 + i] * W1;
    }
}