#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void pw_tanh(float *y, float *a, int n) {
    // Use grid stride loop to handle workloads larger than the block size
    for (int i = blockIdx.x * blockDim.x + threadIdx.x; i < n; i += blockDim.x * gridDim.x) {
        y[i] = tanh(a[i]);
    }
}