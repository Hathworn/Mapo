#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mkRender(float *fb, int max_x, int max_y) {
    // Compute pixel position using ThreadId and BlockId
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    int j = blockDim.y * blockIdx.y + threadIdx.y;

    // Skip computations if pixel position is outside FB size
    if (i >= max_x || j >= max_y) return;

    // Calculate FB pixel value
    int pixel_index = (j * max_x + i) * 3;
    fb[pixel_index] = float(i) / max_x;
    fb[pixel_index + 1] = float(j) / max_y;
    fb[pixel_index + 2] = 0.2f;
}