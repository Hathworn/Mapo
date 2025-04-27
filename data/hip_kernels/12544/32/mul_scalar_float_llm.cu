#include "hip/hip_runtime.h"
#include "includes.h"
extern "C"

__global__ void mul_scalar_float(int n, int idx, float dx, float *dy, int incy, float *result) {
    // Calculate the global index once
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use a loop stride to skip unnecessary iterations
    int stride = blockDim.x * gridDim.x;
    
    for (; i < n; i += stride) {
        if (i >= idx && i % incy == 0) {
            result[i] = dy[i] * dx;
        }
    }
}