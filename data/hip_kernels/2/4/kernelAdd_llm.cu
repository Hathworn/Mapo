#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernelAdd(float const *in1, float const *in2, int _w, int _h, float *out) {
    // Calculate global thread index
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Check if within bounds
    if (x >= _w || y >= _h) return;

    // Pre-calculate index
    int index = y * _w + x;

    // Use HIP intrinsic functions for optimized arithmetic
    float v1 = in1[index];
    float v2 = in2[index];
    out[index] = __fsqrt_rn(__fadd_rn(__fmul_rn(v1, v1), __fmul_rn(v2, v2)));
}