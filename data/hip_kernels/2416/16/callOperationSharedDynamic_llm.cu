#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void callOperationSharedDynamic(int *a, int *b, int *res, int n)
{
    int tid = blockDim.x * blockIdx.x + threadIdx.x;

    if (tid >= n)
    {
        return;
    }

    extern __shared__ int data[];

    int *s_a = data;
    int *s_b = &s_a[blockDim.x];
    // Remove unnecessary third shared memory array
    s_a[threadIdx.x] = a[tid];
    s_b[threadIdx.x] = b[tid];

    // Combine operations and use registers for efficiency
    int temp_res = s_a[threadIdx.x] - s_b[threadIdx.x];
    if (temp_res < 0)
    {
        temp_res = 0;
    }
    
    // Direct assignment to global memory
    res[tid] = temp_res;
}