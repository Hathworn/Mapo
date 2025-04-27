#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void print_mat(float* mat, int row, int col) {
    // Calculate the global thread ID
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use only one thread to print the matrix
    if (id == 0) {
        for (int i = 0; i < row; ++i) {
            for (int j = 0; j < col; ++j) {
                // More efficient printing format
                printf("%.3f\t", mat[i * col + j]);
            }
            printf("\n");
        }
        printf("\n");
    }
}