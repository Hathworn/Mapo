#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scatter(unsigned int *d_in, unsigned int *d_index, unsigned int *d_out, unsigned int in_size) {
    // Use grid-stride loop for improved memory access pattern and handling larger arrays
    for (unsigned int index = threadIdx.x + blockDim.x * blockIdx.x; index < in_size; index += blockDim.x * gridDim.x) {
        d_out[d_index[index]] = d_in[index];
    }
}