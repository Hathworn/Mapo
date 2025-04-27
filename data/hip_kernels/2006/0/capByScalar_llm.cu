#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel for capping values by a scalar
extern "C"
__global__ void capByScalar(int n, float *a, float b, float *result)
{
    // Load cap into a register for faster access
    float cap = b;
    
    // Calculate global index for current thread
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure thread does not exceed array bounds
    if (i < n)
    {
        // Perform capping in a single step
        result[i] = fminf(a[i], cap);
    }
}