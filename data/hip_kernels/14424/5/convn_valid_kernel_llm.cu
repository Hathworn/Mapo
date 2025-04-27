#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void convn_valid_kernel(float *output, float *data, float *kernel, const int H, const int W, const int kH, const int kW) {
    // Matrix index
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;
    
    // vH, vW stands for valid H and valid W
    const int vH = H - kH + 1;
    const int vW = W - kW + 1;

    if (x >= vH || y >= vW)
        return;
    
    // Update x, y temporarily using shared memory for better performance
    __shared__ float sh_kernel[1024]; // Shared memory for kernel
    __shared__ float sh_data[1024];   // Shared memory for data
    
    // Load kernel and data into shared memory
    for (int i = threadIdx.x; i < kH * kW; i += blockDim.x) {
        sh_kernel[i] = kernel[i];
    }
    
    for (int j = threadIdx.y; j < H * W; j += blockDim.y) {
        sh_data[j] = data[j];
    }
    
    __syncthreads();

    float sum = 0;
    for (int i = 0; i < kW; ++i)
        for (int j = 0; j < kH; ++j)
            sum += sh_kernel[i * kH + j] * sh_data[(y + j) * W + (x + i)];

    output[y * vH + x] = sum;
}