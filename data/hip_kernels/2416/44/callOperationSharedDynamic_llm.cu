#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void callOperationSharedDynamic(int *a, int *b, int *res, int k, int p, int n)
{
    int idx = blockDim.x * blockIdx.x + threadIdx.x;
    int idy = blockDim.y * blockIdx.y + threadIdx.y;

    // Return if index is out of bounds
    if (idx >= n || idy >= n)
    {
        return;
    }

    int tid = idx * n + idy;

    extern __shared__ int data[];

    int *s_a = data;
    int *s_b = &s_a[n * n]; // Correcting the size allocation for shared memory
    int *s_res = &s_b[n * n]; // Improving memory usage calculation

    // Use registers for temporary storage
    int local_k = k;
    int local_p = p;

    // Load data into shared memory
    s_a[tid] = a[tid];
    s_b[tid] = b[tid];

    // Perform operation using shared memory
    int temp_res = s_a[tid] + s_b[tid];

    // Conditional operation
    if (temp_res > local_k)
    {
        temp_res = local_p;
    }

    // Store result
    res[tid] = temp_res;
}