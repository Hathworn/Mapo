#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void multScalar(float* in, float* out, float mult, int size) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;
    // Loop unrolling for better performance
    for (int i = tid; i < size; i += stride * 4) {
        if (i < size) out[i] = in[i] * mult;
        if (i + stride < size) out[i + stride] = in[i + stride] * mult;
        if (i + 2 * stride < size) out[i + 2 * stride] = in[i + 2 * stride] * mult;
        if (i + 3 * stride < size) out[i + 3 * stride] = in[i + 3 * stride] * mult;
    }
}