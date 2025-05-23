#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void addScalar(float* in, float* out, float add, int size) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;

    for (; tid < size; tid += stride) {
        // Ensure thread index is within bounds
        out[tid] = in[tid] + add;
    }
}