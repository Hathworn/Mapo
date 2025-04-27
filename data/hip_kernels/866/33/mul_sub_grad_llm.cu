#include "hip/hip_runtime.h"
#include "includes.h"

using namespace std;
#ifndef MAP_FILE
#define MAP_FILE MAP_SHARED
#endif

__global__ void mul_sub_grad(float* in1_x, float* in1_d, float* in2_x, float* in2_d, float* out, int in1ScalarCount, int in2ScalarCount) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;
    
    // Pre-calculate commonly used values
    while (tid < in1ScalarCount) {
        int index = tid % in2ScalarCount;
        
        // Optimize memory access patterns
        float out_val = out[tid];
        float in2_x_val = in2_x[index];
        float in1_x_val = in1_x[tid];
        
        // Shared memory can be used if further optimization is needed depending on in2ScalarCount size
        in1_d[tid] += out_val * in2_x_val;
        in2_d[tid] = in1_x_val * out_val;  // requires reduction

        tid += stride;
    }
}