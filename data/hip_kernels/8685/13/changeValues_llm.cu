#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void changeValues(float *matrix, int size) {
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    if (index < size) {
        // Perform multiplication and type conversion in one step
        matrix[index] = float(int(matrix[index] * 10));
    }
}