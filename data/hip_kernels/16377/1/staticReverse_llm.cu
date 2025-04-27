#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void staticReverse(int *d, int n)
{
    __shared__ int s[64];
    int t = threadIdx.x;
    int tr = n - t - 1;

    // Load data from global to shared memory for the current thread
    if(t < n) {
        s[t] = d[t];
    }
    __syncthreads();

    // Write reversed data back to global memory for the current thread
    if(t < n) {
        d[t] = s[tr];
    }
}