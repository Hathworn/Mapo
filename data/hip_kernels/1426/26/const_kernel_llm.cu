#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void const_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Calculate the global thread index more efficiently
    int i = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * blockDim.x * gridDim.x; 
    // Use single line execution to reduce branching instructions
    if(i < N) X[i * INCX] = ALPHA;
}