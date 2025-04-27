#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function
extern "C"
__global__ void discount(int n, float *a, float *b, float p, float *result)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure all threads execute calculations
    if (i < n)
    {
        result[i] = __fdividef(a[i], 1.0f + b[i] * p);  // Use fast intrinsic for division
    }
}