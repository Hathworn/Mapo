```c
#include "hip/hip_runtime.h"
#include "includes.h"

__device__ size_t GIDX(size_t row, size_t col, int H, int W) {
    return row * W + col;
}

__global__ void kernel_blur(float* d_I, float* d_Ib, int H, int W) {
    // Improved index calculation for boundary check
    size_t row = threadIdx.y + blockDim.y * blockIdx.y;
    size_t col = threadIdx.x + blockDim.x * blockIdx.x;

    // Exit early if out of bounds (reduces redundant checks)
    if (row < KERN_RADIUS || row >= H - KERN_RADIUS || col < KERN_RADIUS || col >= W - KERN_RADIUS) {
        return;
    }

    // Calculate the center index once
    size_t idx = GIDX(row, col, H, W);
    
    // Initialize sum of blurring operation
    float sum = 0.0f;
    int count = 0;
    
    // Use registers to store neighborhood values and accumulate the result
    for (int i = -KERN_RADIUS; i <= KERN_RADIUS; i++) {
        for (int j = -KERN_RADIUS; j <= KERN_RADIUS; j++) {
            sum += d_I[GIDX(row + i, col + j, H, W)] * gaussian_kernel[count];
            count++;
        }
    }
    
    // Write final accumulated value to output
    d_Ib[idx] = sum;
}