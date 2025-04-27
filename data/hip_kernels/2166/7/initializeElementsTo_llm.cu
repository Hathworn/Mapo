#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void initializeElementsTo(int initialValue, int *a, int N)
{
    int i = threadIdx.x + blockIdx.x * blockDim.x;
    if (i < N) // Ensure threads do not access out-of-bounds memory
    {
        a[i] = initialValue;
    }
}