#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_vecDouble(int *in, int *out, const int n)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;  // Calculate global index
    if (i < n) {
        out[i] = in[i] * 2;  // Double the element
    }
}