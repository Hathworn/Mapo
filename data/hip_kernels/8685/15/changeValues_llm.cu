#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void changeValues(double *matrix, int size) {
    int index = (blockIdx.x * blockDim.x) + threadIdx.x;
    if (index < size) {
        // Use fma for better performance and avoid unnecessary type casting
        matrix[index] = trunc(matrix[index] * 10.0);
    }
}