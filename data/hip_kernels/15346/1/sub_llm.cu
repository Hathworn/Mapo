```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sub(int *a, int *b, int *c)
{
    // Use threadIdx.x to support multiple blocks
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Calculate subtraction for the entire array
    c[idx] = a[idx] - b[idx];
}