#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void pw_vecMul(float *y, float *a, float *b, int n) {
    // Use stride loop for handling large arrays efficiently
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;
    while (i < n) {
        y[i] = a[i] * b[i];
        i += stride;
    }
}