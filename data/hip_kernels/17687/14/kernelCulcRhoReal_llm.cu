#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernelCulcRhoReal(const int N, double *rho, double *q, double *p, const double lambda, const double g)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < N)
    {
        double qi = q[i];
        double pi = p[i];
        double qi2 = qi * qi; // Precompute qi squared

        rho[i] = 0.5 * qi2;
        rho[i] += 0.5 * pi * pi;
        double qi4 = qi2 * qi2; // Precompute qi to the fourth power
        rho[i] += (lambda / 4.0) * qi4;
        rho[i] += (g / 6.0) * qi4 * qi2; // Use qi4 and qi2 for sixth power
    }
}