#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void initKernel(double* data, int count, double val) {
    // Cache commonly used indices
    int ti = blockDim.x * blockIdx.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;

    // Unroll loop for performance
    for (int i = ti; i < count; i += stride) {
        data[i] = val;
    }
}