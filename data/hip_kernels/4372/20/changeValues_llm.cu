#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void changeValues(float *matrix, int size) {
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    // Use local variable to store and truncate value before writing to global memory
    if (index < size) {
        float value = matrix[index];
        matrix[index] = ((int)(value * 10));
    }
}