#include "hip/hip_runtime.h"
#include "includes.h"

// Limited version of checkCudaErrors from helper_cuda.h

#define checkCudaErrors(val) check_errors((val), #val, __FILE__, __LINE__)

__global__ void render_init(int width, int length, hiprandState *rand_state) {
    // Compute the global index using single calculation
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int j = blockIdx.y * blockDim.y + threadIdx.y;

    // Early exit for threads outside of target range
    if (i >= width || j >= length) return;

    int index = j * width + i;
    // Initialize the random state
    hiprand_init(1984, index, 0, &rand_state[index]);
}