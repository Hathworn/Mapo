#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void const_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Calculate global index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Access only every 'INCX' element
    int index = i * INCX;

    // Write ALPHA to the specified position if within bounds
    if(index < N) X[index] = ALPHA;
}