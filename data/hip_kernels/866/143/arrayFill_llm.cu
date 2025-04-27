#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void arrayFill(float* data, float value, int size) {
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = gridDim.x * blockDim.x;
    
    // Loop unrolling for increased performance
    for (int i = tid; i < size; i += 4 * stride) {
        if (i < size) data[i] = value;
        if (i + stride < size) data[i + stride] = value;
        if (i + 2 * stride < size) data[i + 2 * stride] = value;
        if (i + 3 * stride < size) data[i + 3 * stride] = value;
    }
}