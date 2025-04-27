#include "hip/hip_runtime.h"
#include "includes.h"

// Global kernel function
extern "C"
__global__ void cuDiv(int n, float *a, float *b, float *result)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < n) {
        // Load data from global memory to registers for faster access
        float ai = a[i];
        float bi = b[i];
        // Perform division and store result back to global memory
        result[i] = ai / bi;
    }
}