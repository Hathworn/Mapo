#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kernel_print(int const* p, int n)
{
    // Use local thread index to optimize memory access
    int idx = threadIdx.x;
    if (idx < n) {
        printf("int: %d ", n);
        printf("%d ", p[idx]);
    }
}