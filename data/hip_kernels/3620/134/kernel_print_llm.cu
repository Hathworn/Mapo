#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_print(size_t const* p, int n)
{
    int threadId = blockIdx.x * blockDim.x + threadIdx.x;
    if (threadId < n)
    {
        printf("Index %d: %lu\n", threadId, p[threadId]);  // Improved memory access using index
    }
}