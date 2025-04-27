#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void prepare_indices(const unsigned num_keys, unsigned *data) {
    unsigned index = blockIdx.x * blockDim.x + threadIdx.x; // Simplified index calculation
    if (index < num_keys) {
        data[index] = index;
    }
}