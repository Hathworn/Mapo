#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void minusScalar(float* in, float* out, float minus, int size) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;
    for (; tid < size; tid += stride) {
        // Combine condition with loop to prevent redundant checks
        out[tid] = in[tid] - minus;
    }
}