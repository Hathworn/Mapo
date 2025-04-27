#include "hip/hip_runtime.h"
#include "includes.h"

extern "C" {}

__global__ void vdivupdate(const int lengthA, const double alpha, const double *a, const double *b, double *c)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Loop unrolling for better performance
    #pragma unroll
    for (; i < lengthA; i += gridDim.x * blockDim.x)
    {
        c[i] += alpha * a[i] / b[i];
    }
}