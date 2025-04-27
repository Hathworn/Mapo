#include "hip/hip_runtime.h"
#include "includes.h"
extern "C"
{
}

__global__ void DXbinaryentropy(const int lengthX, const double *x, const double *y, const double *t, double *z)
{
    int i = threadIdx.x + blockIdx.x * blockDim.x;
    
    // Ensure we do not perform calculations for threads beyond the array bounds
    if (i < lengthX)
    {
        // Precompute constant values and avoid repetitive function calls
        double xi = x[i];
        double yi = y[i];
        double log_term = log(xi * (1.0 - yi) / (yi * (1.0 - xi)));
        
        z[i] += t[0] * log_term / lengthX;
    }
}