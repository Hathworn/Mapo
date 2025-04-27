#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Vector_Addition(const int *dev_a, const int *dev_b, int *dev_c)
{
    // Calculate global thread ID
    unsigned int tid = blockIdx.x * blockDim.x + threadIdx.x;

    // Access global memory using global thread ID, check boundary condition
    if (tid < N)
        dev_c[tid] = dev_a[tid] + dev_b[tid];
}