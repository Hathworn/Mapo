#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void IFD_boundary(int size, double *d_Price, double lambda_U, double lambda_L)
{
    int i = threadIdx.x + blockDim.x * blockIdx.x;
    
    // Check within bounds and handle first and last elements
    if (i == 0) // top condition
    {
        d_Price[i] = lambda_U;
    }
    else if (i == size - 1) // bottom condition
    {
        d_Price[i] = 0.0;
    }
}