#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize the kernel function for better efficiency and readability
extern "C"
{
}

__global__ void binaryentropyXsigmoidY(const int lengthX, const double *x, const double *y, double *z)
{
    int i = threadIdx.x + blockIdx.x * blockDim.x;

    if (i < lengthX)
    {
        // Use registers to store recurring calculations
        double xi = x[i];
        double yi = y[i];
        
        // Simplify calculations by precomputing common expressions
        double log_xi = log(xi);
        double log_1_minus_xi = log(1.0 - xi);
        double exp_yi = exp(yi);
        
        // Compute the result using precomputed values
        z[i] = xi * log_xi + (1.0 - xi) * log_1_minus_xi - xi * yi + log(1.0 + exp_yi);
    }
}