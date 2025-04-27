#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add_float(int n, float *a, float *b, float *sum) {
    // Use grid-stride loop to handle larger arrays efficiently
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;
    for (; i < n; i += stride) {
        sum[i] = a[i] + b[i];
    }
}