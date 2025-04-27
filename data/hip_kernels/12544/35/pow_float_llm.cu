#include "hip/hip_runtime.h"
#include "includes.h"
extern "C"

__global__ void pow_float(int n, int idx, float *dy, int incy, float raise, float *result) {
    // Cache grid and block dimensions for better readability
    int totalThreads = blockDim.x * gridDim.x;
    int threadIndex = blockIdx.x * blockDim.x + threadIdx.x;

    for (int i = threadIndex; i < n; i += totalThreads) {
        // Check if index meets conditions and apply pow operation
        if (i >= idx && i % incy == 0) {
            result[i] = powf(dy[i], raise);
        }
    }
}