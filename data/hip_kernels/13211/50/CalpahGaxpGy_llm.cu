#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize memory access and kernel execution
extern "C"
{
}

__global__ void CalpahGaxpGy(const double alpha, const double *a, const double *b, double *c)
{
    // Calculate global index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Avoid redundant memory access, process only within bounds
    if (i < N) // Assume N is the size of the array
    {
        double aVal = a[0]; // Load constant memory to register
        double bVal = b[i]; // Load once to register
        c[i] = alpha * aVal * bVal + c[i]; // Perform computation
    }
}