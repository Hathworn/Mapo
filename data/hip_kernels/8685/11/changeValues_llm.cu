#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void changeValues(float *matrix, int size) {
    int index = (blockIdx.x * blockDim.x) + threadIdx.x;

    // Check within bounds before accessing the matrix
    if (index < size) {
        // Directly cast the scaled value to int and back to float
        matrix[index] = (float)((int)(matrix[index] * 10));
    }
}