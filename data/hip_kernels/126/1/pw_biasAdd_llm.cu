```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void pw_biasAdd(float *y, float *bias, int n, int nBias) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;
    
    // Loop over elements in a grid-strided manner
    for (; i < n; i += stride) {
        y[i] += bias[i % nBias];
    }
}