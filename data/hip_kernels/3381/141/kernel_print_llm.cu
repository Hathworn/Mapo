#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_print(size_t const* p, int n)
{
    // Cache thread index to reduce repeated calls
    int tid = threadIdx.x;
    if(tid < n) {
        // Minimize use of printf, use a single call for both values
        printf("ulong: %d %lu\n", n, p[tid]);
    }
}