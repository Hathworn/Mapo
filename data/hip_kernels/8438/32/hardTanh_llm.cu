#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void hardTanh(float* in, float* out, float min_val, float max_val, int size) {
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = gridDim.x * blockDim.x;
    // Unrolling loop for improved memory throughput
    for (int i = tid; i < size; i += stride * 4) {
        if (i < size) out[i] = in[i] < min_val ? min_val : (in[i] > max_val ? max_val : in[i]);
        if (i + stride < size) out[i + stride] = in[i + stride] < min_val ? min_val : (in[i + stride] > max_val ? max_val : in[i + stride]);
        if (i + 2 * stride < size) out[i + 2 * stride] = in[i + 2 * stride] < min_val ? min_val : (in[i + 2 * stride] > max_val ? max_val : in[i + 2 * stride]);
        if (i + 3 * stride < size) out[i + 3 * stride] = in[i + 3 * stride] < min_val ? min_val : (in[i + 3 * stride] > max_val ? max_val : in[i + 3 * stride]);
    }
}