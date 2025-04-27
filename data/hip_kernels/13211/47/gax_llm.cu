#include "hip/hip_runtime.h"
#include "includes.h"
extern "C"
{
}

__global__ void gax(const int lengthC, const double *a, const double *b, double *c)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    // Use shared variable for a[0] to reduce global memory access
    __shared__ double a_shared;
    if (threadIdx.x == 0) {
        a_shared = a[0];
    }
    __syncthreads();
    
    if (i < lengthC)
    {
        c[i] = a_shared * b[i];
    }
}