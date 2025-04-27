#include "hip/hip_runtime.h"
#include "includes.h"

// Kernel to perform element-wise division of two arrays
extern "C"
__global__ void cuDiv(int n, float *a, float *b, float *result)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < n)
    {
        // Perform division only if the divisor is not zero
        float div = b[i];
        result[i] = div != 0.0f ? a[i] / div : 0.0f; // Avoid division by zero
    }
}