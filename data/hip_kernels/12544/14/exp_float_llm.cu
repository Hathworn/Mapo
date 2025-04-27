#include "hip/hip_runtime.h"
#include "includes.h"
extern "C"

__global__ void exp_float(int n, int idx, float *dy, int incy, float *result) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;
    // Unroll the loop to improve performance by maximizing memory throughput.
    for (; i < n; i += stride) {
        if (i >= idx && i % incy == 0) {
            result[i] = sinf(dy[i]);
        }
    }
}