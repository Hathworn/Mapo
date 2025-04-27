#include "hip/hip_runtime.h"
#include "includes.h"

__device__ void find_index(short *vec, const int vec_length, int *value, int *index) {
    for (int i = threadIdx.x; i < vec_length; i += blockDim.x) {
        if (vec[i] == *value) {
            atomicMax(index, i);
        }
    }
}

__global__ void find_index(int *vec, const int vec_length, int *value, int *index) {
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global thread ID
    if (i < vec_length && vec[i] == *value) {      // Check bounds and value match
        atomicMax(index, i);
    }
}