#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matrix_multiplication(int *matrix_1, int *matrix_2, int *matrix_r, int m, int n, int p) {
    int row = threadIdx.y + blockIdx.y * blockDim.y;
    int col = threadIdx.x + blockIdx.x * blockDim.x;

    if (row < m && col < p) {
        int sum = 0;
        // Loop unrolling for efficiency
        for(int i = 0; i < n; i += 4) {
            sum += matrix_1[row * n + i]     * matrix_2[i * p + col];
            if (i + 1 < n) sum += matrix_1[row * n + i + 1] * matrix_2[(i + 1) * p + col];
            if (i + 2 < n) sum += matrix_1[row * n + i + 2] * matrix_2[(i + 2) * p + col];
            if (i + 3 < n) sum += matrix_1[row * n + i + 3] * matrix_2[(i + 3) * p + col];
        }
        matrix_r[row * p + col] = sum;
    }
}