#include "hip/hip_runtime.h"
#include "includes.h"

#define domain_width    4096
#define domain_height   2048

__global__ void stencil_kernel(float *x_new, float *x_old) {
    int x = blockIdx.x * blockDim.x + threadIdx.x; // Use blockDim for block size
    int y = blockIdx.y * blockDim.y + threadIdx.y; // Use blockDim for block size

    // Avoid recomputation by calculating index once
    int idx = y * domain_width + x;
    
    if (y > 0 && y < domain_height - 1 && x > 0 && x < domain_width - 1) {
        float sum = x_old[idx] + 
                    x_old[idx - 1] +
                    x_old[idx + 1] +
                    x_old[idx + domain_width] +
                    x_old[idx - domain_width];

        x_new[idx] = sum / 5.0f; // Calculate new value
    }
}