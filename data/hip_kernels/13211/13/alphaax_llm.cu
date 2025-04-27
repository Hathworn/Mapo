#include "hip/hip_runtime.h"
#include "includes.h"
extern "C"
{
}

__global__ void alphaax(const int lengthC, const double alpha, const double *a, const double *b, double *c)
{
    // Calculate global thread ID
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure i is within bounds
    if (i < lengthC)
    {
        // Preload a[0] for all threads once, if possible, before kernel launch
        double a0 = a[0];
        
        // Compute result
        c[i] = alpha * a0 * b[i];
    }
}