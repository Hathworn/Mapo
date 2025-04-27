#include "hip/hip_runtime.h"
#include "includes.h"

#define FIBER 32
#define MATRIX_SIZE 2048
#define DATA_SIZE MATRIX_SIZE * MATRIX_SIZE * sizeof(int)
#define MAX_MATRIX_SIZE (MATRIX_SIZE * MATRIX_SIZE)

using namespace std;

__global__ void kernel_shared(int *A, int *C, int *B, int *result) {
    __shared__ int shared_memory[FIBER][FIBER];

    int global_i = blockIdx.y * blockDim.y + threadIdx.y; // Optimized index calculation
    int global_j = blockIdx.x * blockDim.x + threadIdx.x; // Optimized index calculation

    shared_memory[threadIdx.y][threadIdx.x] = B[global_i * MATRIX_SIZE + global_j];

    __syncthreads();

    int first_index = global_i * MATRIX_SIZE + global_j; // Optimized indexing order
    int second_index = global_j * MATRIX_SIZE + global_i; // Optimized indexing order

    if (first_index < MAX_MATRIX_SIZE && second_index < MAX_MATRIX_SIZE) {
        result[first_index] = (A[first_index] + A[first_index]) * shared_memory[threadIdx.y][threadIdx.x] - C[first_index];
    }
}