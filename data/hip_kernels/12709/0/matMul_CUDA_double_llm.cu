#include "hip/hip_runtime.h"
#include "includes.h"

#define NUM_THREAD  256
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

__global__ void matMul_CUDA_double(double *sum, int size, double *vector1, double *vector2) {
    int row = blockIdx.y * blockDim.y + threadIdx.y;  // Calculate row index
    int col = blockIdx.x * blockDim.x + threadIdx.x;  // Calculate column index

    if (row < size && col < size) {
        double tempSum = 0.0;  // Local accumulator
        for (int k = 0; k < size; ++k) {
            tempSum += vector1[row * size + k] * vector2[k * size + col];  // Compute partial product
        }
        sum[row * size + col] = tempSum;  // Write result to global memory
    }
}