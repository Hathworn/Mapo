#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void longKernel(float *data, int N, float value) {
    // Calculate unique thread index in global memory
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Make sure we do not go out of bounds
    if (idx < N) {
        data[idx] += value;
    }
}