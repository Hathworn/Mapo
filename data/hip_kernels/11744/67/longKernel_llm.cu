#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void longKernel(float *data, int N, float value) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Check if thread index is within bounds
    if (idx < N) {
        data[idx] += value;
    }
}