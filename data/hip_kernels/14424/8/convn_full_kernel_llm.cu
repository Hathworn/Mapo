#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void convn_full_kernel(float *output, float *data, float *kernel, int H, int W, int kH, int kW) {
    // Matrix index
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    // fH, fW stands for full H and full W
    const int fH = H + kH - 1;
    const int fW = W + kW - 1;

    if (x >= fH || y >= fW) 
        return;

    // Initialize sum
    float sum = 0;

    // Use shared memory for kernel
    __shared__ float sharedKernel[1024]; // Assuming kH * kW <= 1024

    // Load kernel to shared memory
    int tid = threadIdx.y * blockDim.x + threadIdx.x;
    if (tid < kH * kW) {
        sharedKernel[tid] = kernel[tid];
    }
    __syncthreads();

    // Convolution loop simplified with shared memory
    for (int i = 0; i < kW; ++i) {
        for (int j = 0; j < kH; ++j) {
            int ii = y - i;
            int jj = x - j;

            // Check boundary conditions
            if (ii >= 0 && ii < W && jj >= 0 && jj < H) {
                sum += sharedKernel[i * kH + j] * data[ii * H + jj];
            }
        }
    }

    // Update output
    output[y * fH + x] = sum;
}