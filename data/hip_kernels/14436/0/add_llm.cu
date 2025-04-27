#include "hip/hip_runtime.h"
#include "includes.h"

#define NUM 100

__global__ void add (int *a, int *b, int *c)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global thread index
    if (idx < NUM) { // Ensure index is within bounds
        c[idx] = a[idx] + b[idx]; // Perform addition for each element
    }
}