#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gAddRow(float* out, const float* in, int length) {
    // Calculate global index
    int index = blockDim.x * blockIdx.x + threadIdx.x;

    // Loop with step size of total threads
    for (int i = index; i < length; i += blockDim.x * gridDim.x) {
        out[i] = in[i] + out[i];
    }
}