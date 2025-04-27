#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matrixVectorMultKernel(float* fltMatrix, float* vec, float* output, int rows, int columns) {
    int row = blockDim.x * blockIdx.x + threadIdx.x;
    // Check if within valid row range
    if(row < rows) {
        float sum = 0.0f;
        // Use shared memory for vector to optimize access
        extern __shared__ float sharedVec[];
        if (threadIdx.x < columns) {
            sharedVec[threadIdx.x] = vec[threadIdx.x];
        }
        __syncthreads();
        
        // Perform dot product
        for (int col = 0; col < columns; ++col) {
            sum += fltMatrix[row * columns + col] * sharedVec[col];
        }
        output[row] = sum;
    }
}