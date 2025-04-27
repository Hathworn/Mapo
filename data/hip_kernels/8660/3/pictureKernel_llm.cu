#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void pictureKernel(float* d_pix, int X, int Y) {
    // Calculate global linear thread index
    int idx = blockIdx.y * blockDim.y * X + blockIdx.x * blockDim.x + threadIdx.y * X + threadIdx.x;

    // Ensure thread is within bounds before processing
    if (threadIdx.x + blockIdx.x * blockDim.x < X && threadIdx.y + blockIdx.y * blockDim.y < Y) {
        d_pix[idx] *= 2; // Efficient memory access with linear indexing
    }
}