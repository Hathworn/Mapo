#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_saxpy(int n, float a, float *x, float *y, float *s)
{
    // Calculate unique thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use loop to enable every thread to perform multiple operations if necessary
    for (int j = i; j < n; j += blockDim.x * gridDim.x) {
        s[j] = a * x[j] + y[j];
    }
}