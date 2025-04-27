#include "hip/hip_runtime.h"
#include "includes.h"

// limited version of checkCudaErrors from helper_cuda.h in CUDA examples
#define checkCudaErrors(val) check_cuda( (val), #val, __FILE__, __LINE__ )

__global__ void render_init(int max_x, int max_y, hiprandState *rand_state) {
    // Cache grid dimensions and block dimensions for efficiency
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int j = blockIdx.y * blockDim.y + threadIdx.y;

    // Boundary check
    if (i >= max_x || j >= max_y) return;

    // Cache pixel index calculation for efficiency
    int pixel_index = j * max_x + i;

    // Initialize random state with a fixed seed and unique sequence number
    hiprand_init(1984, pixel_index, 0, &rand_state[pixel_index]);
}