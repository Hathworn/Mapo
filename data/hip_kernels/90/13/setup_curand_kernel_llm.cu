#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void setup_curand_kernel(hiprandState *state, int count) {
    int id = threadIdx.x + blockIdx.x * blockDim.x; // Adjusted to use blockDim.x for flexibility
    if (id < count) {
        hiprand_init(1234, id, 0, &state[id]);
    }
}