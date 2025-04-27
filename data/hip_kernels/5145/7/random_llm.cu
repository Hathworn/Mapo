#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void random(unsigned int seed, int* result) {
    // Use shared memory if necessary
    __shared__ hiprandState_t state;

    // Initialize state with thread index and block index for more variability
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    hiprand_init(seed, idx, 0, &state);

    // Generate random number using hiprand and store it at the correct index
    result[idx] = hiprand(&state) % MAX;
}