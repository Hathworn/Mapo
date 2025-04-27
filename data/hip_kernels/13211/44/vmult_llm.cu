#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vmult(const int lengthA, const double alpha, const double *a, const double *b, double *c)
{
    // Calculate the global index for the thread
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Check if the index within array bounds before computation
    if (i < lengthA)
    {
        // Perform the element-wise multiplication and scaling
        c[i] = alpha * a[i] * b[i];
    }
}