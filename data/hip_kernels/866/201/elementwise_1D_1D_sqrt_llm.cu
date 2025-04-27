#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void elementwise_1D_1D_sqrt(float* in, float* out, int size) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    // Ensure threads only operate within valid size range
    if (tid < size) {
        out[tid] = sqrt(in[tid]);
    }
}