#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matrix_add_matrix(float* mat1, float* mat2, float* mat3, int row, int col, int sign) {
    // Calculate global index using block and thread indices
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    int size = row * col;
    
    // Perform vectorized addition if within bounds
    if (id < size) {
        mat3[id] = mat1[id] + sign * mat2[id];
    }
}