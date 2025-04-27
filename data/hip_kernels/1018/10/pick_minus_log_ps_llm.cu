#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void pick_minus_log_ps(float *matrix, float *minus_log_ps, unsigned int *indices, unsigned int row, unsigned int col) {
    // Calculate the index for this thread
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure index is within bounds before processing
    if (index < row) {
        // Compute offset once and use shared memory for col
        unsigned int idx = index * col + indices[index];
        // Use a local variable to store the matrix value and improve register usage
        float matrix_value = matrix[idx];
        // Perform log computation and update the result in minus_log_ps
        minus_log_ps[index] = -log(matrix_value);
    }
}