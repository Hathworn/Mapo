#include "hip/hip_runtime.h"
#include "includes.h"

#define FIBER 32
#define MATRIX_SIZE 2048
#define DATA_SIZE MATRIX_SIZE * MATRIX_SIZE * sizeof(int)
#define MAX_MATRIX_SIZE (MATRIX_SIZE * MATRIX_SIZE)

using namespace std;

__global__ void kernel(int *A, int *C, int *B, int *result) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int j = blockIdx.y * blockDim.y + threadIdx.y;

    // Consolidate index calculations
    int first_index = i + j * MATRIX_SIZE;
    
    if (first_index < MAX_MATRIX_SIZE) {
        // Compute second_index only when needed
        int second_index = j + i * MATRIX_SIZE;
        if (second_index < MAX_MATRIX_SIZE) {
            int valueA = A[first_index];
            result[first_index] = (valueA + valueA) * B[second_index] - C[first_index];
        }
    }
}