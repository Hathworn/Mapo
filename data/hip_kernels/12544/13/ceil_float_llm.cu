#include "hip/hip_runtime.h"
#include "includes.h"
extern "C"

__global__ void ceil_float(int n, int idx, float *dy, int incy, float *result) {
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global thread index
    int stride = blockDim.x * gridDim.x; // Calculate stride for all threads
    for (; i < n; i += stride) { 
        if (i >= idx && i % incy == 0) {
            result[i] = ceilf(dy[i]); // Use ceilf for float type
        }
    }
}