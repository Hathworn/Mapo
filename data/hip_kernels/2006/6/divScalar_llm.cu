#include "hip/hip_runtime.h"
#include "includes.h"

// Use shared memory to avoid redundant memory accesses
extern "C"
__global__ void divScalar(int n, float *a, float b, float *result)
{
    // Compute the global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure the thread is within bounds
    if (i < n)
    {
        // Perform division
        result[i] = a[i] / b;
    }
}