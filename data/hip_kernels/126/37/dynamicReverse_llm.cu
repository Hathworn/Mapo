#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void dynamicReverse(int *d, int n)
{
    extern __shared__ int s[];
    int t = threadIdx.x;
    int tr = n - t - 1;

    // Load data into shared memory, ensuring bounds are respected
    if (t < n) {
        s[t] = d[t];
    }
    __syncthreads();

    // Reverse the array and write it back, ensuring bounds are respected
    if (t < n) {
        d[t] = s[tr];
    }
}