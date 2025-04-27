#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mul_sub_grad(float* in1_x, float* in1_d, float* in2_x, float* in2_d, float* out, int in1ScalarCount, int in2ScalarCount) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;

    while (tid < in1ScalarCount) {
        int index = tid % in2ScalarCount;
        
        // Load from global memory into registers to reduce memory access latency
        float out_tid = out[tid];
        float in2_x_index = in2_x[index];
        float in1_x_tid = in1_x[tid];

        // Use register values for computations
        in1_d[tid] += out_tid * in2_x_index;
        in2_d[tid] = in1_x_tid * out_tid;

        tid += stride;
    }
}