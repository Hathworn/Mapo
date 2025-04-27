#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void binarize_kernel(float *x, int n, float *binary)
{
    // Calculate global index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use a stride loop to allow each thread to process multiple elements
    for (; i < n; i += blockDim.x * gridDim.x) {
        binary[i] = (x[i] >= 0) ? 1 : -1;
    }
}