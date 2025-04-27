#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void nodiag_normalize(double *A, double *I, int nn, int i) {
    // Calculate the thread's unique x-coordinate
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    // Calculate the thread's unique y-coordinate
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Skip unnecessary condition check, reducing redundant computation
    if (x < nn && y < nn && x == i && x != y) {
        double inverse = 1.0 / A[i * nn + i]; // Precompute inverse for reuse
        I[x * nn + y] *= inverse;             // Apply the inverse
        A[x * nn + y] *= inverse;             // Apply the inverse
    }
}