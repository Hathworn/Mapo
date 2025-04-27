#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void set_permutation(int *d_permutation, int M)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use ternary operator for efficient conditional assignment
    d_permutation[i] = (i < M) ? i : d_permutation[i];
}