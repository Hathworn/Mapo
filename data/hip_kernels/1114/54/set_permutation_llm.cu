#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void set_permutation(int *d_permutation, int M)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Check index within range inside bounds to reduce branching
    if (i < M) {
        d_permutation[i] = i;
    }
}