#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void binarize_kernel(float *x, int n, float *binary)
{
    // Calculate the global thread index using a single multiplication
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Check the condition and assign values in one line
    if (i < n) binary[i] = (x[i] >= 0) ? 1 : -1;
}