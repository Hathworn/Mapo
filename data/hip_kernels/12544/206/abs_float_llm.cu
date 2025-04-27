#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void abs_float(int n, int idx, float *dy, int incy, float *result) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;

    // Loop with stride for better performance
    for (; i < n; i += stride) {
        if (i >= idx && i % incy == 0) {
            result[i] = fabsf(dy[i]); // Use fabsf for float type
        }
    }
}