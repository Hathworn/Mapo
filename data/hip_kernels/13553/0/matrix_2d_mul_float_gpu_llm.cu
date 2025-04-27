#include "hip/hip_runtime.h"
#include "includes.h"

#define N_THREADS 32

int num_rows_A = 2000; int num_rows_B = 2000; int num_rows_C = 2000;
int num_cols_A = 2000; int num_cols_B = 600; int num_cols_C = 600;

float *A = (float*) malloc(sizeof(float) * num_rows_A * num_cols_A);
float *B = (float*) malloc(sizeof(float) * num_rows_B * num_cols_B);
float *C = (float*) malloc(sizeof(float) * num_rows_C * num_cols_C);
float *C_ref = (float*) malloc(sizeof(float) * num_rows_C * num_cols_C);

__global__ void matrix_2d_mul_float_gpu(float *A, float *B, float *C, int num_rows_A, int num_cols_A, int num_cols_B) {
    // Calculate row and column index for the element
    int i = blockIdx.y * blockDim.y + threadIdx.y;
    int k = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure indices are within bounds
    if (i >= num_rows_A || k >= num_cols_B) return;

    float sum = 0.0f;

    // Perform multiplication and accumulation
    for (int j = 0; j < num_cols_A; j++) {
        sum += A[i * num_cols_A + j] * B[j * num_cols_B + k];
    }

    // Store the result in matrix C
    C[i * num_cols_B + k] = sum;
}