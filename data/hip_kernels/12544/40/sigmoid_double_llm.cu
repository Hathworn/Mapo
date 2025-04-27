#include "hip/hip_runtime.h"
#include "includes.h"
extern "C"

__global__ void sigmoid_double(int n, int idx, double *dy, int incy, double *result) {
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use strided loop for better memory access
    for (; i < n; i += blockDim.x * gridDim.x) {
        // Check conditions and compute sigmoid
        if(i >= idx && i % incy == 0)
            result[i] = 1.0 / (1.0 + exp(-dy[i]));
    }
}