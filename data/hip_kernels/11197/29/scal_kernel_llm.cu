#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void scal_kernel(int N, float ALPHA, float *X, int INCX)
{
    /* Calculate global thread index */
    int i = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * blockDim.x * gridDim.x;
    
    /* Unroll the loop for better performance */
    int stride = blockDim.x * gridDim.x * blockDim.y;
    for (; i < N; i += stride)
    {
        X[i * INCX] *= ALPHA;
    }
}