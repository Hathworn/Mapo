#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void dynamicReverse(int *d, int n)
{
    extern __shared__ int s[];
    int t = threadIdx.x;
    int tr = n - t - 1;

    if (t < n) { // Ensure thread index is within bounds
        s[t] = d[t];
    }
    __syncthreads();

    if (t < n) { // Ensure thread index is within bounds
        d[t] = s[tr];
    }
}