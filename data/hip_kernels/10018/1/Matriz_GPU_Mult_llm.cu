#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Matriz_GPU_Mult(int *a, int *b, int *c) {
    int sum = 0;
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int j = blockIdx.y * blockDim.y + threadIdx.y;

    if (i < N && j < N) {
        // Loop unrolling for performance improvement
        for (int k = 0; k < N; k += 4) {
            sum += a[j * N + k] * b[k * N + i];
            if (k + 1 < N) sum += a[j * N + k + 1] * b[(k + 1) * N + i];
            if (k + 2 < N) sum += a[j * N + k + 2] * b[(k + 2) * N + i];
            if (k + 3 < N) sum += a[j * N + k + 3] * b[(k + 3) * N + i];
        }
        c[j * N + i] = sum;
    }
}