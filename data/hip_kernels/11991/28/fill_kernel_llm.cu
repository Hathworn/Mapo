```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fill_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Calculate global index considering INCX
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if(i * INCX < N) 
    {
        X[i * INCX] = ALPHA;  // Assign ALPHA to the calculated position
    }
}