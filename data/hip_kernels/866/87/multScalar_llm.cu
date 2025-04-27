#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void multScalar(float* in, float* out, float mult, int size) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;
    // Unrolling the loop to improve performance
    for (; tid < size; tid += stride * 4) {
        if (tid < size) out[tid] = in[tid] * mult;
        if (tid + stride < size) out[tid + stride] = in[tid + stride] * mult;
        if (tid + 2 * stride < size) out[tid + 2 * stride] = in[tid + 2 * stride] * mult;
        if (tid + 3 * stride < size) out[tid + 3 * stride] = in[tid + 3 * stride] * mult;
    }
}