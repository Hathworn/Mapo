#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void arrayFill(float* data, float value, int size) {
    int stride = gridDim.x * blockDim.x;
    int tid = threadIdx.x + blockIdx.x * blockDim.x;

    // Use unrolling to reduce loop overhead
    for (int i = tid; i < size; i += stride * 4) {
        data[i] = value;
        if (i + stride < size) data[i + stride] = value;
        if (i + 2 * stride < size) data[i + 2 * stride] = value;
        if (i + 3 * stride < size) data[i + 3 * stride] = value;
    }
}