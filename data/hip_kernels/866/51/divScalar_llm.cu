#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void divScalar(float* in, float* out, float div, int size) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;

    // Reduce branch divergence
    if (tid < size) {
        for (; tid < size; tid += stride) {
            out[tid] = in[tid] / div;
        }
    }
}