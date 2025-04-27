#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void hello(char *a, int *b)
{
    // Use blockDim to parallelize the addition operation
    int idx = threadIdx.x; // Each thread processes one element
    if(idx < 7) // Ensure no out-of-bounds access
    {
        a[idx] += b[idx];
    }
}