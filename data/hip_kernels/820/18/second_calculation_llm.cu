#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void second_calculation(char* dev_a, char* dev_b, char* dev_c, int k, int num_matrices, int matrix_size) {
    // Each thread handles a matrix
    int j = (blockIdx.x * blockDim.x) + threadIdx.x;

    if (j >= matrix_size) return;

    // Precompute base index outside the loop for efficiency
    int base_index = k * matrix_size * matrix_size + j * matrix_size;
    bool add_operation = dev_a[base_index] < threshold;

    for (int i = 0; i < matrix_size; i++) {
        int index = base_index + i;
        if (add_operation) {
            dev_c[index] = dev_a[index] + dev_b[index]; // Perform addition
        } else {
            dev_c[index] = dev_a[index] - dev_b[index]; // Perform subtraction
        }
    }
}