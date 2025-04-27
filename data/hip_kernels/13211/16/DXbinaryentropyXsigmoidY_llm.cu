#include "hip/hip_runtime.h"
#include "includes.h"
extern "C"
{
}

__global__ void DXbinaryentropyXsigmoidY(const int lengthX, const double *x,  const double *y, const double *t, double *z)
{
    // Calculate the global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure we are within bounds
    if (i < lengthX)
    {
        // Read x[i] once and store it in a register to reduce global memory access
        double xi = x[i];

        // Compute log term and subtraction in a single step
        double log_term = log(xi / (1.0 - xi));
        
        // Update z[i] using only necessary arithmetic operations
        z[i] -= t[0] * (y[i] - log_term) / lengthX;
    }
}