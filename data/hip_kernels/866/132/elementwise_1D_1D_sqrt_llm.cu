#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void elementwise_1D_1D_sqrt(float* in, float* out, int size) {
    // Calculate global thread ID
    int tid = blockIdx.x * blockDim.x + threadIdx.x;

    // Use a while loop for stride access which is more efficient
    while (tid < size) {
        out[tid] = sqrtf(in[tid]); // Use sqrtf for float inputs
        tid += gridDim.x * blockDim.x;
    }
}