#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add_calculation(char* dev_a, char* dev_b, char* dev_c, int k, int j, int num_matrices, int matrix_size) {
    // Calculate unique thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Calculate the offset in the data array for the matrix
    int offset = k * matrix_size * matrix_size + j * matrix_size;
    
    if (i < matrix_size) { // Ensure thread operates within valid range
        int index = offset + i; // Pre-compute index once
        dev_c[index] = dev_a[index] + dev_b[index]; // Direct addition to target
    }
}