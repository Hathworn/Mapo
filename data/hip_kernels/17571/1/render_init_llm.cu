#include "hip/hip_runtime.h"
#include "includes.h"

// limited version of checkCudaErrors from helper_cuda.h in CUDA examples
#define checkCudaErrors(val) check_cuda( (val), #val, __FILE__, __LINE__ )

__global__ void render_init(int max_x, int max_y, hiprandState* rand_state) {
    // Calculate the global index
    int i = threadIdx.x + blockIdx.x * blockDim.x;
    int j = threadIdx.y + blockIdx.y * blockDim.y;

    // Check index bounds
    if ((i < max_x) && (j < max_y)) {
        // Simplify calculations for unique seed index
        int k = (i + j) % 100;

        if ((i + j) / 100 == 0) {
            // Initialize random state with unique k
            hiprand_init(1995, k, 0, &rand_state[k]);
        }
    }
}