#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sigmoid_float(int n, int idx, float *dy, int incy, float *result) {
    // Use thread ID to calculate the index directly
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int totalThreads = blockDim.x * gridDim.x;

    while (i < n) {
        if (i >= idx && i % incy == 0) {
            result[i] = 1.0f / (1.0f + expf(-dy[i]));
        }
        i += totalThreads;
    }
}