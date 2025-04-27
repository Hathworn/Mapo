#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void initializeElementsTo(int initialValue, int *a, int N)
{
    int i = threadIdx.x + blockIdx.x * blockDim.x;
    // Ensure the index is within the bounds of the array
    if (i < N) {
        a[i] = initialValue;
    }
}