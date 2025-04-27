#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void value_add_matrix(float* __restrict__ mat1, float* __restrict__ mat2, int row, int col, float v) {
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;
    int size = row * col;
    
    // Loop to handle sizes larger than the current block/grid configuration
    for (int i = id; i < size; i += stride) {
        mat2[i] = mat1[i] + v;  // Efficient memory access pattern
    }
}