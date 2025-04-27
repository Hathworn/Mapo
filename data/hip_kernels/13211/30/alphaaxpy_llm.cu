#include "hip/hip_runtime.h"
#include "includes.h"
extern "C"
{
}
__global__ void alphaaxpy(const int lengthC, const double alpha, const double *a, const double *b, double *c)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < lengthC)
    {
        // Use registers to potentially lower memory load/store latencies
        double ai = a[0];
        double bi = b[i];
        double ci = c[i];
        
        // Perform computation
        c[i] = alpha * ai * bi + ci;
    }
}