#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize kernel launch by ensuring warp size processing
__global__ void add(int *a, int *b, int *c)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x; // Calculate unique global index for the thread
    c[idx] = a[idx] + b[idx]; // Perform the addition using global index
}