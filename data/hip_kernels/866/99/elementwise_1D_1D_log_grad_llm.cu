```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void elementwise_1D_1D_log_grad(float* in_x, float* in_d, float* out_x, float* out_d, int size) {
    // Calculate unique thread ID
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    // Ensure thread within bounds
    if (tid < size) {
        // Directly update in_d at this thread
        in_d[tid] += out_d[tid] / in_x[tid];
    }
}