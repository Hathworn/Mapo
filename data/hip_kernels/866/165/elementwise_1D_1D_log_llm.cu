#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void elementwise_1D_1D_log(float* in, float* out, int size) {
    // Calculate unique global thread ID
    int tid = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure no overrun condition by using a single check
    if (tid < size) {
        out[tid] = log(in[tid]);
    }
    
    // Utilize stride for more threads
    int stride = gridDim.x * blockDim.x;
    for (tid += stride; tid < size; tid += stride) {
        out[tid] = log(in[tid]);
    }
}