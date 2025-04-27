#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void vectorAdd(const float *A, const float *B, float *C, int numElements)
{
    // Efficiently compute global thread index
    int i = hipBlockDim_x * hipBlockIdx_x + hipThreadIdx_x;

    // Use loop unrolling if applicable
    if (i < numElements)
    {
        C[i] = A[i] + B[i];
        
        if (i + hipBlockDim_x < numElements) // Double the work per thread
        {
            C[i + hipBlockDim_x] = A[i + hipBlockDim_x] + B[i + hipBlockDim_x];
        }
    }
}