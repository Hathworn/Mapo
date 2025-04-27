#include "hip/hip_runtime.h"
#include "includes.h"

#define checkCudaErrors(val) check_cuda( (val), #val, __FILE__, __LINE__ )

__global__ void render_init(int max_x, int max_y, hiprandState* rand_state) {
    // Use shared memory for faster access in cache
    extern __shared__ hiprandState shared_rand_state[];
    
    int i = threadIdx.x + blockIdx.x * blockDim.x;
    int j = threadIdx.y + blockIdx.y * blockDim.y;

    if((i >= max_x) || (j >= max_y)) return;

    int pixel_index = j * max_x + i;

    // Each thread initializes its own state in shared memory
    hiprand_init(1984, pixel_index, 0, &shared_rand_state[threadIdx.x + threadIdx.y * blockDim.x]);

    // Copy shared state back to global memory
    rand_state[pixel_index] = shared_rand_state[threadIdx.x + threadIdx.y * blockDim.x];
}