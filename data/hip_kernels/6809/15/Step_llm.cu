#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void Step(float * x, size_t idx, size_t N)
{
    // Calculate the global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    // Efficient boundary check and loop unrolling
    if (i < N)
    {
        float temp = x[(idx-1)*N+i];
        x[(idx-1)*N+i] = temp > 0 ? 1.0f : 0.0f;
    }
    return;
}