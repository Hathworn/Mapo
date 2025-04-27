#include "hip/hip_runtime.h"
#include "includes.h"
#define N 100

__global__ void add(int *a, int *c)
{
    // Use thread index to improve parallelism
    int tID = blockIdx.x * blockDim.x + threadIdx.x;
    
    if (tID < N)
    {
        // Direct computation without additional variable
        c[tID] = 3 * a[tID];
    }
}