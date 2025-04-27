#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void elementwise_1D_1D_add(float* in1, float* in2, float* out, int size) {
    // Calculate global thread ID
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;

    // Loop over the elements using the stride
    for (int i = tid; i < size; i += stride) {
        out[i] = in1[i] + in2[i];
    }
}