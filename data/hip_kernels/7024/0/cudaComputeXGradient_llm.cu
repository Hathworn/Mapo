#include "hip/hip_runtime.h"
#include "includes.h"

hipEvent_t start, stop;

__global__ void cudaComputeXGradient(int* x_gradient, unsigned char* channel, int image_width, int image_height) {
    __shared__ int x_kernel[3][3];
    if (threadIdx.x < 3 && threadIdx.y < 3) {
        int local_x_kernel[3][3] = { 
            { 1, 0, -1 }, 
            { 2, 0, -2 }, 
            { 1, 0, -1 } 
        };
        x_kernel[threadIdx.x][threadIdx.y] = local_x_kernel[threadIdx.x][threadIdx.y];
    }
    __syncthreads(); // Ensure all threads have loaded the kernel

    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx <= 0 || idx >= image_width * image_height - 1) {
        return;
    }

    int gx = 0;
    for (int dy = -1; dy <= 1; ++dy) {
        for (int dx = -1; dx <= 1; ++dx) {
            int cx = idx % image_width + dx;
            int cy = idx / image_width + dy;
            if (cx >= 0 && cx < image_width && cy >= 0 && cy < image_height) {
                int c_idx = cy * image_width + cx;
                gx += x_kernel[dy + 1][dx + 1] * channel[c_idx];
            }
        }
    }
    x_gradient[idx] = gx;
}