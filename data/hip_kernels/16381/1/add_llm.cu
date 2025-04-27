#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void add(int *a, int *b, int *c)
{
    // Compute global index
    int index = threadIdx.x + blockIdx.x * blockDim.x;

    // Check to ensure the index does not exceed the array bounds
    if (index < blockDim.x * gridDim.x) {
        c[index] = a[index] + b[index];
    }
}