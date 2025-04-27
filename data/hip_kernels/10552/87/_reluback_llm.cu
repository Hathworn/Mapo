#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void _reluback(int n, float *y, float *dy) {
    // Use stride to cover the entire range
    for (int i = threadIdx.x + blockIdx.x * blockDim.x; i < n; i += blockDim.x * gridDim.x) {
        // Set gradient to zero for inactive ReLU neurons
        dy[i] = (y[i] <= 0) ? 0 : dy[i];
    }
}