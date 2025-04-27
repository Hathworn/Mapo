#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void dynamicReverse(int *d, int n)
{
    extern __shared__ int s[];
    int t = threadIdx.x;
    int b = blockIdx.x * blockDim.x;
    
    // Calculate the index for the reversed array
    int tr = n - b - t - 1;
    // Load data from global to shared memory
    s[t] = d[b + t];
    __syncthreads();
    // Store reversed data back to global memory
    d[b + t] = s[tr - b];
}