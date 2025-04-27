#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void elementwise_1D_1D_mul(float* in1, float* in2, float* out, int size) {
    // Calculate the global thread index
    int tid = blockIdx.x * blockDim.x + threadIdx.x;

    // Use 'grid-stride loop' to allow one thread to handle multiple elements
    for (int i = tid; i < size; i += blockDim.x * gridDim.x) {
        // Ensure the thread index is within bounds and perform multiplication
        if (i < size) {
            out[i] = in1[i] * in2[i];
        }
    }
}