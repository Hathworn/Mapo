#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void longKernel(float *data, int N, float value) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;  // Calculate global index
    int stride = gridDim.x * blockDim.x;  // Calculate stride

    for (int i = idx; i < N; i += stride) {
        data[i] += value;  // Update element at index i
    }
}