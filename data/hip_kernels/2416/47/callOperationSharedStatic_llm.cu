#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void callOperationSharedStatic(int *a, int *b, int x, int *res, int n)
{
    int tid = blockDim.x * blockIdx.x + threadIdx.x;

    if (tid >= n)
    {
        return;
    }

    // Utilize shared memory optimally for fewer threads per block
    extern __shared__ int shared_mem[];
    int *s_a = shared_mem;
    int *s_b = shared_mem + blockDim.x;
    int *s_res = shared_mem + 2 * blockDim.x;
    int s_x = x;

    // Ensure that only active threads perform memory operations
    s_a[threadIdx.x] = a[tid];
    s_b[threadIdx.x] = b[tid];

    __syncthreads(); // Synchronize threads in the block before computation

    s_res[threadIdx.x] = ((s_a[threadIdx.x] * s_x) + s_b[threadIdx.x]);

    __syncthreads(); // Synchronize threads before writing results

    res[tid] = s_res[threadIdx.x];
}