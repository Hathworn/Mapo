#include "hip/hip_runtime.h"
#include "includes.h"
extern "C"
{
}

__global__ void vadd(const int n, const double *a, const double *b, double *c)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use stride for better memory coalescing and load balancing
    for (; i < n; i += blockDim.x * gridDim.x)  
    {
        c[i] = a[i] + b[i];
    }
}