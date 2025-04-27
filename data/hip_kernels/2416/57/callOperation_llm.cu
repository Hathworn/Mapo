#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void callOperation(int *a, int *b, int *c, int n)
{
    int tid = blockDim.x * blockIdx.x + threadIdx.x;
    
    // Bounds check to prevent out-of-bounds memory access
    if (tid >= n) return;

    // Use conditional operator to simplify and avoid branch divergence
    c[tid] = (a[tid] <= b[tid]) ? a[tid] : b[tid];
}