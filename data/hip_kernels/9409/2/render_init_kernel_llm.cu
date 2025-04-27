#include "hip/hip_runtime.h"
#include "includes.h"

extern "C" void check_cuda(hipError_t result, char const *const func, const char *const file, int const line);

__global__ void render_init_kernel(int max_x, int max_y, hiprandState *rand_state) {
    // Cache the block and thread indices
    int ix = blockIdx.x * blockDim.x + threadIdx.x;
    int iy = blockIdx.y * blockDim.y + threadIdx.y;

    // Calculate a linear index based on the 2D indices
    int pixel_index = iy * max_x + ix;

    // Return early if out of bounds
    if (ix >= max_x || iy >= max_y) return;

    // Initialize the random state without offset
    hiprand_init(1984, pixel_index, 0, &rand_state[pixel_index]);
}