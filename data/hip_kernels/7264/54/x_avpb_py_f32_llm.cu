#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void x_avpb_py_f32(float* x, float a, float* v, float b, float* y, int len) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Use loop unrolling for potential performance gain
    if (idx < len) {
        y[idx] += x[idx] * (a * v[idx] + b);
        if (idx + blockDim.x < len) {
            y[idx + blockDim.x] += x[idx + blockDim.x] * (a * v[idx + blockDim.x] + b);
        }
    }
}