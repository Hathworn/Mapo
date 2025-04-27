```c
#include "hip/hip_runtime.h"
#include "includes.h"

#define TOLERANCE 0.00001
#define TRUE 1
#define FALSE 0

long usecs();
void initialize(double **A, int rows, int cols);
int calc_serial(double **A, int rows, int cols, int iters, double tolerance);
int calc_serial_v1(double **A, int rows, int cols, int iters, double tolerance);
int calc_omp(double **A, int rows, int cols, int iters, double tolerance, int num_threads);
int calc_gpu(double **A, int rows, int cols, int iters, double tolerance);
double verify(double **A, double **B, int rows, int cols);


__global__ void calc_kernel(double* w, double* r, int rows, int cols, double tolerance) {
    int row = blockIdx.x * blockDim.x + threadIdx.x;
    int col = blockIdx.y * blockDim.y + threadIdx.y;

    // Ensure row and column indices are within bounds
    if (row >= 1 && row < rows - 1 && col >= 1 && col < cols - 1) {
        int idx = row * cols + col; // Correct row-major order index calculation
        // Perform calculation with boundary checks
        w[idx] = 0.2 * (r[idx + 1] + r[idx - 1] + r[(row - 1) * cols + col] + r[(row + 1) * cols + col]); 
    }
}