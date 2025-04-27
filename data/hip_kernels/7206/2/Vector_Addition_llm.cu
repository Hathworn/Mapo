```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void Vector_Addition(const int *dev_a, const int *dev_b, int *dev_c)
{
    // Get the global thread ID
    unsigned int tid = blockIdx.x * blockDim.x + threadIdx.x;

    // Optimize by checking boundary condition once and using for loop
    for (; tid < N; tid += blockDim.x * gridDim.x)
    {
        dev_c[tid] = dev_a[tid] + dev_b[tid];
    }
}