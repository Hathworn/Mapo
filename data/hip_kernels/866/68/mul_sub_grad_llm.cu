```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mul_sub_grad(float* in1_x, float* in1_d, float* in2_x, float* in2_d, float* out, int in1ScalarCount, int in2ScalarCount) {
    // Calculate global thread ID
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use a stride loop to cover all elements
    int stride = gridDim.x * blockDim.x;
    for (int i = tid; i < in1ScalarCount; i += stride) {
        // Calculate index for the in2 array
        int index = i % in2ScalarCount;
        
        // Perform computation and update gradients
        float tmp = out[i];
        atomicAdd(&in1_d[i], tmp * in2_x[index]); // Use atomic add to handle concurrent writes
        in2_d[i] = in1_x[i] * tmp;
    }
}