#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void const_kernel(int N, float ALPHA, float *X, int INCX) 
{
    // Calculate the global index using block and grid dimensions
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use loop to process multiple elements per thread for better utilization
    for (int idx = i; idx < N; idx += blockDim.x * gridDim.x) 
    {
        X[idx * INCX] = ALPHA;
    }
}