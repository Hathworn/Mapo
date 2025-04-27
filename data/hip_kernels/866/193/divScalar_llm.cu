#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void divScalar(float* in, float* out, float div, int size) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;
    // Loop unrolling for performance improvement
    for (; tid + 3 < size; tid += stride * 4) {
        out[tid] = in[tid] / div;
        out[tid + 1] = in[tid + 1] / div;
        out[tid + 2] = in[tid + 2] / div;
        out[tid + 3] = in[tid + 3] / div;
    }
    // Handle remaining elements
    for (; tid < size; tid += stride) {
        out[tid] = in[tid] / div;
    }
}