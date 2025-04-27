#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void divide_by_vector(float *matrix, float *vector, unsigned int row, unsigned int col) {
    // Calculate global index
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure index is within bounds
    if (index < row * col) {
        // Precompute vector index only once
        unsigned int vecIndex = index / col; 
        matrix[index] /= vector[vecIndex];
    }
}