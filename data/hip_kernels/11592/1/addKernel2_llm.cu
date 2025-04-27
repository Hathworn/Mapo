#include "hip/hip_runtime.h"
#include "includes.h"
hipError_t addWithCuda(int *c, const int *a, const int *b, size_t size);

__global__ void addKernel2(int *c, const int *a, const int *b)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Use both block and thread index for better parallelization
    c[i] = (a[i] + b[i]) * 2;
}