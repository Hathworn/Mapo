#include "hip/hip_runtime.h"
#include "includes.h"

using namespace std;
#ifndef MAP_FILE
#define MAP_FILE MAP_SHARED
#endif

__global__ void mul_sub(float* in1, float* in2, float* out, int in1ScalarCount, int in2ScalarCount) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;

    // Use loop unrolling for better performance
    for (int i = tid; i < in1ScalarCount; i += stride * 4) {
        if (i < in1ScalarCount)
            out[i] = in1[i] * in2[i % in2ScalarCount];
        if (i + stride < in1ScalarCount)
            out[i + stride] = in1[i + stride] * in2[(i + stride) % in2ScalarCount];
        if (i + 2 * stride < in1ScalarCount)
            out[i + 2 * stride] = in1[i + 2 * stride] * in2[(i + 2 * stride) % in2ScalarCount];
        if (i + 3 * stride < in1ScalarCount)
            out[i + 3 * stride] = in1[i + 3 * stride] * in2[(i + 3 * stride) % in2ScalarCount];
    }
}