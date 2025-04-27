#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_print(int const* p, int n)
{
    int idx = threadIdx.x + blockIdx.x * blockDim.x; // Calculate flattened index
    if (idx < n) {
        printf("int: %d %d\n", n, p[idx]); // Use index to access array element and reduce iteration complexity
    }
}