#include "hip/hip_runtime.h"
#include "includes.h"

using namespace std;

__global__ void matrixMultiplicationKernel(long* A, long* B, long* C, long N) {
    long ROW = (blockIdx.y * blockDim.y) + threadIdx.y;
    long COL = (blockIdx.x * blockDim.x) + threadIdx.x;

    long tmpSum = 0;

    // Check bounds to ensure we do not access out of matrix bounds
    if (ROW < N && COL < N) {
        // Optimize by unrolling the loop when N is known and divisible
        for (long i = 0; i < N; i++) {
            tmpSum += A[ROW * N + i] * B[i * N + COL];
        }
        C[ROW * N + COL] = tmpSum;
    }
}