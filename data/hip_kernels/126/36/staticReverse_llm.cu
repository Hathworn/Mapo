#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void staticReverse(int *d, int n)
{
    extern __shared__ int s[];
    int t = threadIdx.x;
    int tr = n - t - 1;

    // Load data into shared memory
    if (t < n) s[t] = d[t];
    __syncthreads();

    // Read from shared memory and write to global memory
    if (tr < n) d[t] = s[tr];
}