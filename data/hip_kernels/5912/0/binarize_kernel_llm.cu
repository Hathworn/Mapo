#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void binarize_kernel(float *x, int n, float *binary)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Efficient check to stay within bounds
    if (i < n) {
        binary[i] = (x[i] >= 0) ? 1 : -1;
    }
}