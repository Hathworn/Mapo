#include "hip/hip_runtime.h"
#include "includes.h"

#ifdef CUDNN
#pragma comment(lib, "cudnn.lib")
#endif

extern "C" {
}

__global__ void binarize_kernel(float *x, int n, float *binary)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Calculate flat index
    if (i < n) { // Ensure within bounds before accessing
        binary[i] = (x[i] >= 0) ? 1.0f : -1.0f; // Direct assignment with constant values
    }
}