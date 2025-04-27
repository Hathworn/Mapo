#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void changeValues(float *matrix, int size) {
    int index = (blockIdx.x * blockDim.x) + threadIdx.x;
    if (index < size) {
        // Combine calculations to reduce temporary variables
        matrix[index] = (float)((int)(matrix[index] * 10));
    }
}