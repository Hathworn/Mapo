#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void longKernel(float *data, int N, float value) {
    // Optimize kernel by using thread indexing
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < N) {
        data[idx] += value;
    }
}