#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void changeValues(float *matrix, int size) {
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    if (index < size) {
        // Use native HIP function for faster computation
        matrix[index] = floorf(matrix[index] * 10);
    }
}