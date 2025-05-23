#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void init_one_vec(float *d_one_vec, size_t length) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure that only valid threads work; reducing divergent threads
    if (i < length) {
        d_one_vec[i] = 1.f;
    }
}