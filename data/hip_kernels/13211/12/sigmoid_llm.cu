#include "hip/hip_runtime.h"
#include "includes.h"
extern "C"   // ensure function name to be exactly "gax"
{
}

__global__ void sigmoid(const int lengthA, const double *a, double *b)
{
    // Use a single load and computation to improve performance
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    if (i < lengthA)
    {
        double val = a[i];          // Cache a[i] in register
        val = exp(-val);            // Compute exp(-a[i])
        b[i] = 1.0 / (1.0 + val);   // Compute 1.0 / (1.0 + exp(-a[i]))
    }
}