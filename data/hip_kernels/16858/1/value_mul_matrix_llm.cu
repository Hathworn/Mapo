#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void value_mul_matrix(float* mat1, float* mat2, int row, int col, float v) {
    // Calculate unique thread index
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    int size = row * col;
    // Ensure work is done only for valid thread indices
    if (id < size) {
        mat2[id] = mat1[id] * v;
    }
}