#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mul_sub_grad(float* in1_x, float* in1_d, float* in2_x, float* in2_d, float* out, int in1ScalarCount, int in2ScalarCount) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;

    if (tid < in1ScalarCount) {  // Ensure tid is within bounds
        int index = tid % in2ScalarCount;
        // Cooperative thread indexing for better memory usage
        for (int i = tid; i < in1ScalarCount; i += stride) {
            in1_d[i] += out[i] * in2_x[index];
            in2_d[i] = in1_x[i] * out[i];  // This is the temp array, needs to be reduced!
        }
    }
}