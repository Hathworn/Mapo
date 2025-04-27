#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void const_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Use a more concise expression to calculate the index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use a stride loop for better parallel workload distribution
    for (; i < N; i += blockDim.x * gridDim.x) 
    {
        X[i * INCX] = ALPHA;
    }
}