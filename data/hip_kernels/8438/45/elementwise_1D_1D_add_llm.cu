#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void elementwise_1D_1D_add(float* in1, float* in2, float* out, int size) {
    // Calculate unique thread index
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Avoid unnecessary conditional check in loop
    if (tid < size) {
        // Iterating with stride
        int stride = gridDim.x * blockDim.x;
        for (; tid < size; tid += stride) {
            out[tid] = in1[tid] + in2[tid];
        }
    }
}