#include "hip/hip_runtime.h"
#include "includes.h"

# define MAX(a, b) ((a) > (b) ? (a) : (b))

# define GAUSSIAN_KERNEL_SIZE 3
# define SOBEL_KERNEL_SIZE 5
# define TILE_WIDTH 32
# define SMEM_SIZE 128

__global__ void highHysterisis(int width, int height, float* d_nonMax, float highThreshold, float *d_highThreshHyst) {
    // Calculate unique thread index in the global memory
    int ix = threadIdx.x + blockIdx.x * blockDim.x;
    int iy = threadIdx.y + blockIdx.y * blockDim.y;

    // Calculate the linear index in the array
    int tid = iy * width + ix;

    // Check bounds to avoid accessing invalid memory
    if (ix < width && iy < height) {
        // Perform thresholding
        d_highThreshHyst[tid] = d_nonMax[tid] > highThreshold ? 1.0f : 0.0f;
    }
}