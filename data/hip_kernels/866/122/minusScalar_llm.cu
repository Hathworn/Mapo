#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void minusScalar(float* in, float* out, float minus, int size) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;

    // Use a more efficient loop structure without if-check inside
    while (tid < size) {
        out[tid] = in[tid] - minus;
        tid += stride;
    }
}