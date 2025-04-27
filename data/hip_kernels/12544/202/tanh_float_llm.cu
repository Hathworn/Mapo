#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void tanh_float(int n, int idx, float *dy, int incy, float *result) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;
    
    // Loop unroll to improve memory access coalescing
    while (i < n) {
        if (i >= idx && i % incy == 0)
            result[i] = tanh(dy[i]);
        i += stride;
    }
}