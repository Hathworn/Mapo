#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_Phi4_Phi6(const int N, double *t, double *q, const double lambda, const double g)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure index is within bounds and minimize floating-point operations
    if (i < N)
    {
        double qi = q[i];
        double qi_square = qi * qi;
        t[i] = qi_square * qi * (lambda + g * qi_square);
    }
}