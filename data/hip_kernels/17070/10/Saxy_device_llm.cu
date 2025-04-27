#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void Saxy_device(float* x, float* y, float* d, float xb, float yb, int n)
{
    // Calculate global index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure index is within bounds
    if (i < n)
    {
        // Perform vector operation
        d[i] = (x[i] - xb) * (y[i] - yb);
    }
}