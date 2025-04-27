#include "hip/hip_runtime.h"
#include "includes.h"

#define domain_width    4096
#define domain_height   2048

__global__ void stencil_kernel(float *x_new, float *x_old) {
    int x = blockIdx.x * blockDim.x + threadIdx.x; // Use blockDim for cleaner indexing
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    if (y > 0 && y < domain_height - 1 && x > 0 && x < domain_width - 1) {
        int center = y * domain_width + x; // Precompute center index
        x_new[center] = (
            x_old[center] +
            x_old[center - 1] +
            x_old[center + 1] +
            x_old[center + domain_width] +
            x_old[center - domain_width]
        ) / 5.0f;
    }
}