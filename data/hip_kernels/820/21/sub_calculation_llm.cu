#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void sub_calculation(char* dev_a, char* dev_b, char* dev_c, int k, int j, int num_matrices, int matrix_size) {
    // Calculate the global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure thread handles valid matrix element index
    if (i < matrix_size) {
        int index = (k * matrix_size + j) * matrix_size + i;
        dev_c[index] = dev_a[index] - dev_b[index];
    }
}