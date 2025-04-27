#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void elementwise_1D_1D_square(float* in, float* out, int size) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;

    // Use a more compact loop by removing duplicate condition
    for (int index = tid; index < size; index += blockDim.x * gridDim.x) {
        out[index] = in[index] * in[index];
    }
}