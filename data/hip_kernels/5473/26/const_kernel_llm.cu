#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void const_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Calculate the unique global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure grid coverage before access
    if (i < N) {
        X[i * INCX] = ALPHA;
    }
}