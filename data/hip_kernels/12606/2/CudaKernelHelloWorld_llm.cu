#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void CudaKernelHelloWorld(char *a, int *b)
{
    // Using blockDim.x for global indexing to support more threads
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    a[idx] += b[idx];
}