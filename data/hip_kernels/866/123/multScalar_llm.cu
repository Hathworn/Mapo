#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void multScalar(float* in, float* out, float mult, int size) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;

    // Check if thread ID is within bounds before computation
    if (tid < size) {
        out[tid] = in[tid] * mult;
    }
}