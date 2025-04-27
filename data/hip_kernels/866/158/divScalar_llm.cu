#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void divScalar(float* in, float* out, float div, int size) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;
    // Use tid for boundary check and computation
    if (tid < size) {
        out[tid] = in[tid] / div;
        tid += stride; // Increment tid for further loop iterations
    }
}