#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void changeValues(float *matrix, int size) {
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    // Ensure index is within bounds and process multiple elements per thread
    for (int i = index; i < size; i += blockDim.x * gridDim.x) {
        float a = matrix[i] * 10.0f;
        matrix[i] = floorf(a); // Direct conversion to integer using built-in function
    }
}