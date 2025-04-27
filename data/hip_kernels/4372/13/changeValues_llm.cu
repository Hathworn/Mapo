#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void changeValues(float *matrix, int size) {
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    if (index < size) {
        // Combine operations and remove unnecessary casting
        matrix[index] = (int)(matrix[index] * 10);
    }
}