#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vectorAdd(const float *A, const float *B, float *C, int numElements)
{
    int i = hipBlockDim_x * hipBlockIdx_x + hipThreadIdx_x;

    // Use built-in variable for efficiency, handling boundary check.
    if (i < numElements)
    {
        C[i] = A[i] + B[i];
    }
    // Removed unnecessary printf for cleaner execution.
}