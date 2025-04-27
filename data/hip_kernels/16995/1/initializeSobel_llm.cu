```c
#include "hip/hip_runtime.h"
#include "includes.h"

#define MAX(a, b) ((a) > (b) ? (a) : (b))
#define GAUSSIAN_KERNEL_SIZE 3
#define SOBEL_KERNEL_SIZE 5
#define TILE_WIDTH 32
#define SMEM_SIZE 128

__global__ void initializeSobel(float *d_sobelKernelX, float *d_sobelKernelY) {
    int ix = threadIdx.x;
    int iy = threadIdx.y;
    
    // Calculate workload directly based on limits of the kernel size
    if (ix < SOBEL_KERNEL_SIZE && iy < SOBEL_KERNEL_SIZE) {
        int index = iy * SOBEL_KERNEL_SIZE + ix;
        
        // Use constant memory for reusable values
        const float weight = (float)(SOBEL_KERNEL_SIZE / 2);
        float sx = (float)(ix - weight);
        float sy = (float)(iy - weight);
        float norm = sx * sx + sy * sy;

        // Branch optimization: handle division outside conditional
        float sx_norm_weight = sx / norm * weight;
        float sy_norm_weight = sy / norm * weight;
        
        d_sobelKernelX[index] = (norm == 0.0f) ? 0.0f : sx_norm_weight;
        d_sobelKernelY[index] = (norm == 0.0f) ? 0.0f : sy_norm_weight;
    }
}