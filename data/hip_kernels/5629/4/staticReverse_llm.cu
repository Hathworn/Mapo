#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void staticReverse(int *d, int n)
{
    // Allocate shared memory dynamically to handle arrays larger than 64 elements
    extern __shared__ int s[];
    int t = threadIdx.x;
    int tr = n-t-1;
    
    // Ensure threads do not access out-of-bound memory
    if (t < n) 
    {
        s[t] = d[t];
    }
    __syncthreads();
    
    if (t < n) 
    {
        d[t] = s[tr];
    }
}