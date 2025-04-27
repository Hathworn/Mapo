#include "hip/hip_runtime.h"
#include "includes.h"

/* Prototype matrix representation. */
struct dag_array_t {
    size_t rows;
    size_t cols;
    int* matrix;
};

/*
DAG Primitive. 
*/
const int tp_TILE_DIM = 32;
const int tp_BLOCK_ROWS = 8;

// Optimized global kernel function
__global__ void multiplyMatrixVector(int* result, int* matrix, int* vector, int cols) {
    __shared__ int reduce_array[tp_TILE_DIM]; // Use tp_TILE_DIM for shared memory size

    int vector_slice_offset = blockIdx.x * cols + threadIdx.x;
    int matrix_slice_offset = blockIdx.y * cols + threadIdx.x;

    // Load data into shared memory
    reduce_array[threadIdx.x] = matrix[matrix_slice_offset] * vector[vector_slice_offset];

    __syncthreads();

    // Parallel reduction
    for (int stride = tp_BLOCK_ROWS / 2; stride > 0; stride >>= 1) {
        if (threadIdx.x < stride) {
            reduce_array[threadIdx.x] += reduce_array[threadIdx.x + stride];
        }
        __syncthreads();
    }

    // Write result
    if (threadIdx.x == 0) {
        result[blockIdx.x * cols + blockIdx.y] = reduce_array[0];
    }
}