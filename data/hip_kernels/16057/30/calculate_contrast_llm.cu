#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void calculate_contrast(float *norm, float *contrast, int *dif, int max, float sum, int size) {
    int ix = threadIdx.x + blockIdx.x * blockDim.x;
    int iy = threadIdx.y + blockIdx.y * blockDim.y;
    unsigned int idx = iy * max + ix;

    // Boundary check to ensure idx is within limits
    if (idx >= size) return;

    contrast[idx] = norm[idx] * dif[idx];

    // In-block reduction
    for (int stride = 1; stride < blockDim.x; stride *= 2) { 
        __syncthreads(); // Synchronize before accessing shared data
        if (threadIdx.x % (2 * stride) == 0 && idx + stride < size) {
            contrast[idx] += contrast[idx + stride];
        }
    }

    // Print the result from the first thread of the first block
    if (idx == 0) {
        printf("contrast %f\n", contrast[0]);
    }
}