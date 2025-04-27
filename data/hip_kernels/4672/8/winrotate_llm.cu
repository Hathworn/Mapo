#include "hip/hip_runtime.h"
#include "includes.h"

// Global kernel function
__global__ void winrotate(float* inframe2, const float* inframe, const float *win, int N, int offset) {
    int k = threadIdx.x + blockIdx.x * blockDim.x;
    if (k < N) {
        // Perform computation only if within bounds
        int index = (k + offset) % N;
        inframe2[k] = win[k] * inframe[index];
    }
}