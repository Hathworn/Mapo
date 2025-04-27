#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void arrayFill(float* data, float value, int size) {
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = gridDim.x * blockDim.x;

    // Unroll the loop for better performance
    for (int i = tid; i < size; i += stride * 4) {
        data[i] = value;
        if (i + stride < size) data[i + stride] = value;
        if (i + stride * 2 < size) data[i + stride * 2] = value;
        if (i + stride * 3 < size) data[i + stride * 3] = value;
    }
}