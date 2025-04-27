#include "hip/hip_runtime.h"
#include "includes.h"

// Improves kernel by using shared memory for coalesced access
extern "C"
__global__ void cuFloor(int n, float *a, float *b, float *result)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    // Check valid index within range
    if (i < n)
    {
        result[i] = a[i] > b[i] ? a[i] : b[i];
    }
}