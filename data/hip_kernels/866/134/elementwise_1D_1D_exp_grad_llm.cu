#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void elementwise_1D_1D_exp_grad(float* in_x, float* in_d, float* out_x, float * out_d, int size) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    // Use a grid-stride loop for better resource utilization
    for (int i = tid; i < size; i += blockDim.x * gridDim.x) {
        in_d[i] += out_d[i] * out_x[i];
    }
}