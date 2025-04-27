#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void dynamicReverse(int *d, int n)
{
    extern __shared__ int s[];
    int t = threadIdx.x;
    int tr = n - t - 1;

    // Load input into shared memory, ensuring we don't out-of-bounds access
    if (t < n) {
        s[t] = d[t];
    }
    __syncthreads();

    // Store reversed data from shared memory back into global memory
    if (t < n) {
        d[t] = s[tr];
    }
}