#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void log_double(int n, int idx, double *dy, int incy, double *result) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;

    // Use stride-based loop for better parallel efficiency
    for (; i < n; i += stride) {
        if (i >= idx && i % incy == 0) {
            result[i] = log(dy[i]);
        }
    }
}