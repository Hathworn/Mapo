#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add(int* a, int* b, int* c)
{
    // Calculate the thread id for this thread in the grid
    int tid = blockIdx.x * blockDim.x + threadIdx.x;

    // Check if tid is within the bounds, avoiding out-of-bounds access
    if (tid < gridDim.x * blockDim.x) {
        c[tid] = a[tid] + b[tid];
    }
}