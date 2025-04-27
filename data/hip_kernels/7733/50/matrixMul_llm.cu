#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matrixMul(double *a, double *b, double *C, int cols, int rows, int cols2)
{
    // Use shared memory for faster access
    extern __shared__ double shared[];
    double* sharedA = shared;
    double* sharedB = shared + blockDim.x * blockDim.y;

    int row = blockIdx.x * blockDim.x + threadIdx.x;
    int col = blockIdx.y * blockDim.y + threadIdx.y;
    
    double sum = 0.0;

    if (row < rows && col < cols) {
        for (int k = 0; k < cols2; k += blockDim.x) {
            if (threadIdx.x + k < cols2 && col < cols) {
                sharedA[threadIdx.y * blockDim.x + threadIdx.x] = a[row * cols2 + threadIdx.x + k];
                sharedB[threadIdx.y * blockDim.x + threadIdx.x] = b[(threadIdx.x + k) * cols + col];
            } else {
                sharedA[threadIdx.y * blockDim.x + threadIdx.x] = 0.0;
                sharedB[threadIdx.y * blockDim.x + threadIdx.x] = 0.0;
            }
            __syncthreads();

            for (int n = 0; n < blockDim.x; ++n) {
                sum += sharedA[threadIdx.y * blockDim.x + n] * sharedB[n * blockDim.x + threadIdx.x];
            }
            __syncthreads();
        }
        C[row * cols + col] = sum;
    }
}