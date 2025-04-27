#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kernel_print(long const* p, int n)
{
    // Get the thread's global index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Only print the data if the thread index is zero to avoid redundant prints
    if (idx == 0) {
        printf("long: %d ", n);
        for (int i = 0; i < n; i++) {
            printf("%ld ", *(p + i));
        }
    }
}