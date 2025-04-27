#include "hip/hip_runtime.h"
#include "includes.h"

// Improved kernel with grid-stride loop and coalesced access
__global__ void kernel_example(int *c, const int *a, const int *b, int N)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;
    for (int i = idx; i < N; i += stride) {
        c[i] = a[i] + b[i];
    }
}