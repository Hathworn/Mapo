#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void scal_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Calculate unique thread index for 1D block and grid
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    // Use stride of block size to allow processing of larger data
    int stride = blockDim.x * gridDim.x;
    // Loop over the array in steps of block size
    for (; i < N; i += stride)
    {
        X[i * INCX] *= ALPHA;
    }
}