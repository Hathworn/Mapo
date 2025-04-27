#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scal_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Optimize by using a faster calculation for the index.
    int i = blockIdx.x * blockDim.x + threadIdx.x; 
    if(i < N) 
    {
        X[i*INCX] *= ALPHA;
    }
}