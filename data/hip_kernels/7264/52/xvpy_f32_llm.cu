#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void xvpy_f32(float* __restrict__ x, float* __restrict__ v, float* __restrict__ y, int len) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < len) {
        // Optimize memory access by using registers
        float x_val = x[idx];
        float v_val = v[idx];
        y[idx] += x_val * v_val;
    }
}