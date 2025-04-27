#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void MyKernel(int *a, int *b, int *c, int N)
{
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    
    // Ensure all threads within a warp reach this point before proceeding
    __syncthreads();

    if (idx < N) {
        // Use register for intermediate computation
        int temp = a[idx] + b[idx];
        c[idx] = temp;
    }
}