#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void InitializeMatrix_kernel(int8_t *matrix, int ldm, int rows, int columns) {
    // Optimize index calculation for improved readability and remove redundant checks
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int j = blockIdx.y * blockDim.y + threadIdx.y;

    if (i < rows && j < columns) {
        int offset = i + j * ldm;
        matrix[offset] = 0;

        // Combine conditions since both set matrix[offset] to 0x0
        if ((i >= rows - 2 && j < 1) || (i < 1 && j >= columns - 2)) {
            matrix[offset] = 0x0;
        }
    }
}