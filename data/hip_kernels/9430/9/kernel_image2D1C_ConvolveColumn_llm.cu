```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_image2D1C_ConvolveColumn(float* img, int n_x, int n_y, short k, float *kernel, float* out)
{
    // Find index of current thread
    int idx_x = blockIdx.x * blockDim.x + threadIdx.x;
    int idx_y = blockIdx.y * blockDim.y + threadIdx.y;

    // Check within bounds
    if (idx_x < n_x && idx_y < n_y) {
        float sum = 0;
        // Loop unrolling for optimization
        #pragma unroll
        for (short i = -k; i <= k; ++i) {
            short y = idx_y + i;
            if (y < 0) y = 0;
            if (y >= n_y) y = n_y - 1;
            sum += kernel[i + k] * img[y * n_x + idx_x];
        }
        // Store the result
        out[idx_y * n_x + idx_x] = sum;
    }
}