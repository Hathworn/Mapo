#include "hip/hip_runtime.h"
#include "includes.h"
__device__ void init_vectors(short *vec, const int vec_length) {
    for (int i = threadIdx.x; i < vec_length; i += blockDim.x) {
        vec[i] = 0;
    }
}

__global__ void init_vectors(int *vec, const int vec_length) {
    int index = blockIdx.x * blockDim.x + threadIdx.x; // Calculate unique index
    int stride = blockDim.x * gridDim.x;               // Calculate the grid wide stride
    for (int i = index; i < vec_length; i += stride) { // Iterate over the array with grid stride loops
        vec[i] = 0;
    }
}