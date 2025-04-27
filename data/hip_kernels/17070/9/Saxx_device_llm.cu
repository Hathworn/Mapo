#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Saxx_device(float* x, float* c, float xb, int n)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Use block indexing for larger arrays
    if (i < n)
    {
        float diff = x[i] - xb; // Store result of subtraction
        c[i] = diff * diff;     // Square the difference
    }
}