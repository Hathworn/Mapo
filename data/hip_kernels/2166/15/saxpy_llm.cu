#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void saxpy(int * a, int * b, int * c, int N)
{
    int tid = blockIdx.x * blockDim.x + threadIdx.x; // Fixed index calculation by using + operator
    if (tid < N) // Unchanged bounds check
    {
        c[tid] = 2 * a[tid] + b[tid]; // Simple calculation remained intact
    }
}