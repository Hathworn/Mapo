#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void log_float(int n, int idx, float *dy, int incy, float *result) {
    // Calculate the global index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use stride loop for thread efficiency
    while (i < n) {
        if (i >= idx && i % incy == 0) {
            result[i] = logf(dy[i]);
        }
        i += blockDim.x * gridDim.x;
    }
}