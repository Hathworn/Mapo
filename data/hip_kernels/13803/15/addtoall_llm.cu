#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void addtoall(int* a, int b)
{
    // Calculate global index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    // Ensure index within bounds (assuming the calling code uses appropriate block/grid dimensions)
    if (i < N) { 
        atomicAdd(&(a[i]), b);
    }
}