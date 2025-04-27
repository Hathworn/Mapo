#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sigmoid_double(int n, int idx, double *dy, int incy, double *result) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;
    // Iterate with a stride, optimizing loop increments
    while (i < n) {
        if (i >= idx && i % incy == 0) {
            result[i] = 1.0 / (1.0 + exp(-dy[i]));
        }
        i += stride;
    }
}