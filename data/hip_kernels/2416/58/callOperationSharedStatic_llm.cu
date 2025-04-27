#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void callOperationSharedStatic(int *a, int *b, int *c, int n)
{
    int tid = blockDim.x * blockIdx.x + threadIdx.x;

    if (tid >= n) {
        return;
    }

    // Declare shared memory with dynamic size using extern keyword
    extern __shared__ int shared_mem[];
    int *s_a = shared_mem;
    int *s_b = shared_mem + blockDim.x;
    int *s_c = shared_mem + 2 * blockDim.x;

    // Use shared memory indices local to the block, not the global index
    int local_id = threadIdx.x;

    s_a[local_id] = a[tid];
    s_b[local_id] = b[tid];

    if (s_a[local_id] <= s_b[local_id])
    {
        s_c[local_id] = s_a[local_id];
    }
    else
    {
        s_c[local_id] = s_b[local_id];
    }
    c[tid] = s_c[local_id];
}