#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void binarize_kernel(float *x, int n, float *binary)
{
    // Use blockDim.x to maximize parallel threads
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x; // Calculate stride for potential loop iteration
    while (i < n) {
        binary[i] = (x[i] >= 0) ? 1 : -1;
        i += stride; // Increment index by stride for loop iteration
    }
}