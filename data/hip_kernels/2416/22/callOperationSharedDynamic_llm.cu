#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void callOperationSharedDynamic(int *a, int *b, int *res, int k, int p, int n)
{
    int tid = blockDim.x * blockIdx.x + threadIdx.x;
    
    if (tid >= n)
    {
        return;
    }

    extern __shared__ int data[];

    int *s_a = data;
    int *s_b = &s_a[n];

    // Use registers for constants to reduce shared memory accesses
    int s_k = k;
    int s_p = p;

    // Load input data into shared memory
    s_a[threadIdx.x] = a[tid];
    s_b[threadIdx.x] = b[tid];

    // Perform computation using shared memory
    int sum = s_a[threadIdx.x] + s_b[threadIdx.x];
    res[tid] = (sum > s_k) ? s_p : sum;
}