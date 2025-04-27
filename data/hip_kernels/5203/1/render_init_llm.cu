#include "hip/hip_runtime.h"
#include "includes.h"

using namespace std;

// limited version of checkCudaErrors from helper_cuda.h in CUDA examples
#define checkCudaErrors(val) check_cuda( (val), #val, __FILE__, __LINE__ )

__global__ void render_init(int max_x, int max_y, hiprandState *rand_state) {
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Use consistent indexing
    int j = blockIdx.y * blockDim.y + threadIdx.y;
    if(i < max_x && j < max_y) { // Use boundary condition check early
        int pixel_index = j * max_x + i;
        // Each thread gets same seed, a different sequence number, no offset
        hiprand_init(1984, pixel_index, 0, &rand_state[pixel_index]);
    }
}