#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void floor_float(int n, int idx, float *dy, int incy, float *result) {
    // Calculate only once and reuse
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;
    
    // Loop unrolling for better performance
    for (; i + stride < n; i += stride * 2) {
        if (i >= idx && i % incy == 0) {
            result[i] = floor(dy[i]);
        }
        if (i + stride < n && (i + stride) >= idx && (i + stride) % incy == 0) {
            result[i + stride] = floor(dy[i + stride]);
        }
    }
    
    if (i < n && i >= idx && i % incy == 0) {
        result[i] = floor(dy[i]);
    }
}