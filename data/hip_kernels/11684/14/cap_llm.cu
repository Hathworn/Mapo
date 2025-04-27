#include "hip/hip_runtime.h"
#include "includes.h"

// Use extern "C" for function linkage
extern "C"
// Global Kernel Function
__global__ void cap(int n, float *a, float *b, float *result)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Check thread index within bounds
    if (i < n)
    {
        // Perform element-wise capping operation
        result[i] = min(a[i], b[i]);
    }
}