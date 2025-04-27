#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernelGetOmega(const int N, double *omega, double *kSqr, 
                               const double sigma2, const double sigma4, 
                               const double lambda, const double g)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Check within bounds and pre-calculate constants for efficiency
    if (i < N)
    {
        const double constant = 3 * lambda * sigma2 + 15 * g * sigma4;
        omega[i] = sqrt(1.0 + kSqr[i] + constant);
    }
}