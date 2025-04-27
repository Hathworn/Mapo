#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void clipAt(float* in, float bound, int size) {
    // Using stride-based iteration for better memory access.
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;
    while (tid < size) {
        // Combined condition checks for better performance.
        if (in[tid] > bound) {
            in[tid] = bound;
        } else if (in[tid] < -bound) {
            in[tid] = -bound;
        }
        tid += stride;
    }
}