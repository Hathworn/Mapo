#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add(int *a, int *b, int *c, int N)
{
    int tID = blockIdx.x * blockDim.x + threadIdx.x;  // Use both block and thread index
    if (tID < N) 
    {
        c[tID] = a[tID] + b[tID];  // Efficiently utilize thread parallelism
    }
}