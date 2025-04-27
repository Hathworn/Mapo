#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void hardTanh(float* in, float* out, float min_val, float max_val, int size) {
    // Calculate unique thread index
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = gridDim.x * blockDim.x;

    // Unrolling the loop to process multiple elements per iteration
    for (int i = tid; i < size; i += stride * 4) {
        if (i < size) out[i] = fminf(fmaxf(in[i], min_val), max_val);
        if (i + stride < size) out[i + stride] = fminf(fmaxf(in[i + stride], min_val), max_val);
        if (i + 2 * stride < size) out[i + 2 * stride] = fminf(fmaxf(in[i + 2 * stride], min_val), max_val);
        if (i + 3 * stride < size) out[i + 3 * stride] = fminf(fmaxf(in[i + 3 * stride], min_val), max_val);
    }
}