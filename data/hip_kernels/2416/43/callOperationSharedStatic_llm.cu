#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void callOperationSharedStatic(int *a, int *b, int *res, int k, int p, int n)
{
    // Calculate thread's unique index
    int idx = blockDim.x * blockIdx.x + threadIdx.x;
    int idy = blockDim.y * blockIdx.y + threadIdx.y;

    // Check if index is within bounds
    if (idx >= n || idy >= n) return;
    
    int tid = idx * n + idy;

    // Declare shared memory
    extern __shared__ int s_data[];
    int* s_a = s_data;
    int* s_b = s_data + n * n;
    int* s_res = s_data + 2 * n * n;

    // Load data into shared memory
    s_a[tid] = a[tid];
    s_b[tid] = b[tid];
    __syncthreads(); // Ensure all data is loaded

    // Perform operation in shared memory
    int sum = s_a[tid] + s_b[tid];
    s_res[tid] = (sum > k) ? p : sum;

    __syncthreads(); // Ensure all operations are complete

    // Write result back to global memory
    res[tid] = s_res[tid];
}