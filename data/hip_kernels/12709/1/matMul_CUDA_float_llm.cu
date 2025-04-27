#include "hip/hip_runtime.h"
#include "includes.h"

#define NUM_THREAD  256  // Number of thread blocks
#define print(x) printf("%d",x)

float *matrixMul_float_serial(float vector1[], float vector2[], int size);
float *matrixMul_float_parallel(float vector1[], float vector2[], int size, int thread_count);
float *matrixMul_float_cuda(float* vector1, float* vector2, int num);
double *matrixMul_double_serial(double vector1[], double vector2[], int size);
double *matrixMul_double_parallel(double vector1[], double vector2[], int size, int thread_count);
double *matrixMul_double_cuda(double* vector1, double* vector2, int num);
double doubleGen();
float floatGen();
void operations(int size, int parallel, int serial, int cuda, int verify, int thread_count);
void print_results_float( int size, double time_spent);
void print_results_double( int size, double time_spent);
double verifyVectord(double *vector1, double *vector2, int size);
float verifyVectorf(float *vector1, float *vector2, int size);

__global__ void matMul_CUDA_float(float *sum, int size, float *vector1, float *vector2) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int row = idx / size;  // Calculate row index
    int col = idx % size;  // Calculate column index

    // Ensure idx is within bounds
    if (idx < size * size) {
        float localSum = 0; // Use local variable for accumulation
        for (int k = 0; k < size; k++) {
            localSum += vector1[row * size + k] * vector2[k * size + col];
        }
        sum[idx] = localSum; // Write back to global memory once
    }
}