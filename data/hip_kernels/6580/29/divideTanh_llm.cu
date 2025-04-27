#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void divideTanh(float* out, const float* __restrict__ in1, const float* __restrict__ in2, int size) {
    int id = blockIdx.x * blockDim.x + threadIdx.x;

    // Use a warp-level optimization to increase memory access efficiency
    if (id < size) {
        float val1 = __ldg(&in1[id]);
        float val2 = __ldg(&in2[id]);
        out[id] = val1 / val2;
    }
}