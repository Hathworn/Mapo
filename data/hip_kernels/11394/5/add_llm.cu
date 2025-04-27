#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add(int *a, int *b, int *c)
{
    // Calculate global index
    int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Perform calculation only up to array size
    if (index < N) {
        c[index] = a[index] + b[index];
    }
}