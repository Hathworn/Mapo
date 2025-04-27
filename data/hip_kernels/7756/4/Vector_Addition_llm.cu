#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Vector_Addition(const int* __restrict__ dev_a, const int* __restrict__ dev_b, int* __restrict__ dev_c) 
{
    // Use int for tid to support larger indices; leverage __restrict__ for better memory access optimization
    int tid = blockDim.x * blockIdx.x + threadIdx.x;
    if (tid < N) // boundary condition check remains efficient
    {
        dev_c[tid] = dev_a[tid] + dev_b[tid];
    }
}