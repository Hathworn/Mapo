#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void calculateError(float *aFourth, float *err, int expectedOutput)
{
    // Use blockIdx and blockDim to handle more data or larger arrays
    int index = threadIdx.x + blockIdx.x * blockDim.x;

    // Ensure index is within array bounds
    if (index < expectedOutput) {
        err[index] = aFourth[index] - (index + 1 == expectedOutput);
    }
}