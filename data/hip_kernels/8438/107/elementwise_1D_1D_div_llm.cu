#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void elementwise_1D_1D_div(float* in1, float* in2, float* out, int size) {
    // calculate the thread ID
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;
    
    // loop through elements using the stride
    for (; tid < size; tid += stride) {
        // perform division if index is within bounds
        float val2 = in2[tid];
        // add a check to avoid division by zero
        out[tid] = (val2 != 0.0f) ? (in1[tid] / val2) : 0.0f;
    }
}