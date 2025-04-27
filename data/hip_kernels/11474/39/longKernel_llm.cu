#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void longKernel(float *data, int N, float value) {
    // Calculate global thread ID
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    // Check bounds and perform operation
    if (tid < N) {
        data[tid] += value;
    }
}