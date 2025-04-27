#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void exp_float(int n, int idx, float *dy, int incy, float *result) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;

    // Use strided loop for better occupancy
    for (; i < n; i += stride) {
        if (i >= idx && i % incy == 0) {
            result[i] = expf(dy[i]);
        }
    }
}