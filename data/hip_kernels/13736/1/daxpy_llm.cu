#include "hip/hip_runtime.h"
#include "includes.h"

#define N 100000000

__global__ void daxpy(int n, double alpha, double *x, double *y) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;
    
    // Use a stride loop to process elements more efficiently
    for (; idx < n; idx += stride) {
        y[idx] += alpha * x[idx];
    }
}