#include "hip/hip_runtime.h"
#include "includes.h"

extern "C"
{
}

__global__ void rectlin(const int n, const double *a, double *b)
{
    // Use grid-stride loop for better parallelism
    for (int i = threadIdx.x + blockIdx.x * blockDim.x; i < n; i += blockDim.x * gridDim.x) 
    {
        // Use ternary operator for clearer and compact code
        b[i] = (a[i] > 0.0) ? a[i] : 0.0;
    }
}