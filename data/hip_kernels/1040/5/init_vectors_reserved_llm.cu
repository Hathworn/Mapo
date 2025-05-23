#include "hip/hip_runtime.h"
#include "includes.h"

__device__ void init_vectors_reserved(short *vec, const int vec_length) {
    for (int i = threadIdx.x; i < vec_length; i = i + blockDim.x) {
        if (vec[i] != -1) {
            vec[i] = 0;
        }
    }
}

__device__ void init_vectors(short *vec, const int vec_length) {
    for (int i = threadIdx.x; i < vec_length; i = i + blockDim.x) {
        vec[i] = 0;
    }
}

__global__ void init_vectors_reserved(int *vec, const int vec_length) {
    int i = blockDim.x * blockIdx.x + threadIdx.x;  // Calculate global index
    if (i < vec_length) {  // Ensure within bounds
        if (vec[i] != -1) {
            vec[i] = 0;
        }
    }
}