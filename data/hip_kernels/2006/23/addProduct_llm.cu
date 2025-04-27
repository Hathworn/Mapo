#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized global kernel function
extern "C"
__global__ void addProduct(int n, float *a, float *b, float *c, float *result)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Process the elements within bounds
    if (i < n)
    {
        result[i] = a[i] + b[i] * c[i];
    }
    
    // Utilize all available threads by processing additional elements if needed
    for (int j = i + blockDim.x * gridDim.x; j < n; j += blockDim.x * gridDim.x)
    {
        result[j] = a[j] + b[j] * c[j];
    }
}