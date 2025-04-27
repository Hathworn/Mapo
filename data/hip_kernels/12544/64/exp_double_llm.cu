#include "hip/hip_runtime.h"
#include "includes.h"
extern "C"

__global__ void exp_double(int n, int idx, double *dy, int incy, double *result) {
    // Calculate the unique thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    // Stride loop for better access pattern
    int stride = blockDim.x * gridDim.x;
    for (; i < n; i += stride) {
        if (i >= idx && i % incy == 0) {
            result[i] = exp(dy[i]);
        }
    }
}