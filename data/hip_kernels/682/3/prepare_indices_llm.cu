#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void prepare_indices(const unsigned num_keys, unsigned *data) {
    // Calculate the 1D global thread index more efficiently
    unsigned index = blockIdx.x * blockDim.x + threadIdx.x;
    if (index < num_keys) {
        data[index] = index; // Assign index directly to the data array
    }
}