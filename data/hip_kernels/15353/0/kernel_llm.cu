#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel(float* indata, float* outdata, int* Size, float* Spacing)
{
    const int i = blockIdx.x * blockDim.x + threadIdx.x;
    const int j = blockIdx.y * blockDim.y + threadIdx.y;

    // Return early if out of bounds
    if (i >= Size[0] || j >= Size[1]) {
        return;
    }

    // Calculate linear index variable once
    int index = j + i * Size[1];
    
    // Compute output data with pre-computed index
    outdata[index] = indata[index] * (Size[0] + Spacing[1]);

    // Minimize print overhead by avoiding repeated calculations in printf
    printf("[%d,%d] -> %.2f -> %.2f\n", i, j, indata[index], outdata[index]);
}