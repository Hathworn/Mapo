#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void rotatewin(float* aframe2, float *aframe, float *win, int N, int offset) {
    int k = threadIdx.x + blockIdx.x * blockDim.x;
    
    // Check if k is within the limit and prevent out-of-bounds access
    if (k < N) {
        // Calculate the index once, avoid recalculating, for better performance
        int index = (k + offset) % N;
        aframe2[index] = win[k] * aframe[k];
    }
}