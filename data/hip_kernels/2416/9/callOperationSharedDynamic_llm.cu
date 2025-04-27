#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void callOperationSharedDynamic(int *a, int *b, int *res, int x, int n)
{
    int tid = blockDim.x * blockIdx.x + threadIdx.x;

    if (tid >= n)
    {
        return;
    }

    extern __shared__ int arrays[];
    
    // Combine data load into shared memory
    int *s_a = arrays;
    int *s_b = &arrays[n];
    s_a[tid] = a[tid];
    s_b[tid] = b[tid];
    
    // Directly operate on memory
    res[tid] = s_a[tid] - (s_b[tid] * x);
}