#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void calculation(char* dev_a, char* dev_b, char* dev_c, int num_matrices, int matrix_size) {
    // Each thread handles a matrix
    int k = (blockIdx.x * blockDim.x) + threadIdx.x;
    if (k >= num_matrices) return;

    // Use shared memory for matrix operations within a block
    extern __shared__ char shared_mem[];
    char* shared_a = shared_mem;
    char* shared_b = shared_a + matrix_size * matrix_size;

    for (int j = 0; j < matrix_size; j++) {
        for (int i = 0; i < matrix_size; i++) {
            int index = k * matrix_size * matrix_size + j * matrix_size + i;
            // Load data into shared memory to reduce global memory access
            shared_a[j * matrix_size + i] = dev_a[index];
            shared_b[j * matrix_size + i] = dev_b[index];
        }
    }

    // Synchronize threads to ensure all data is loaded
    __syncthreads();

    // If first element is different than 0, do the computation
    if (shared_a[0] != 0) {
        for (int j = 0; j < matrix_size; j++) {
            // If first value in the row of the matrix, do addition
            if (shared_a[j * matrix_size] < threshold) {
                for (int i = 0; i < matrix_size; i++) {
                    int index = k * matrix_size * matrix_size + j * matrix_size + i;
                    dev_c[index] = shared_a[j * matrix_size + i] + shared_b[j * matrix_size + i];
                }
            } else { // Do subtraction
                for (int i = 0; i < matrix_size; i++) {
                    int index = k * matrix_size * matrix_size + j * matrix_size + i;
                    dev_c[index] = shared_a[j * matrix_size + i] - shared_b[j * matrix_size + i];
                }
            }
        }
    }
}