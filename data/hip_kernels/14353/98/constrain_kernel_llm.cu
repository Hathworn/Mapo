#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void constrain_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Calculate global index for each thread
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Stride through the array if the total number of elements is more than the total number of threads
    for (; i < N; i += blockDim.x * gridDim.x)
    {
        // Constrain each element to the range [-ALPHA, ALPHA]
        X[i * INCX] = fminf(ALPHA, fmaxf(-ALPHA, X[i * INCX]));
    }
}