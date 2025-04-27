#include "hip/hip_runtime.h"
#include "includes.h"

#ifdef CUDNN
#pragma comment(lib, "cudnn.lib")
#endif

extern "C" {
}

__global__ void binarize_kernel(float *x, int n, float *binary)
{
    // Calculate the global index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    // Check index within bounds
    if (i < n) {
        // Perform binarization
        binary[i] = (x[i] >= 0) ? 1 : -1;
    }
}