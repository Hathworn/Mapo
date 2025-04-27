#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void changeValues(double *matrix, int size) {
    // Calculate the unique global thread index
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    // Check if index is within bounds
    if (index < size) {
        // Multiply by 10 and truncate directly
        matrix[index] = floor(matrix[index] * 10.0);
    }
}