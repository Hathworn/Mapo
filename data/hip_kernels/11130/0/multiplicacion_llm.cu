#include "hip/hip_runtime.h"
#include "includes.h"
#define N 100
#define T 4

void llenarMatriz(int*);

__global__ void multiplicacion(int *a, int *b, int *c) {
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Calculate the row index
    int j = blockIdx.y * blockDim.y + threadIdx.y; // Calculate the column index

    if (i < N && j < N) { // Ensure bounds are within matrix size
        int sum = 0; // Temp variable to store sum
        for (int k = 0; k < N; k++) {
            sum += a[k + i * N] * b[j + k * N]; // Accumulate product
        }
        c[j + i * N] = sum; // Store result in c
    }
}