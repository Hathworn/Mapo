#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void MatrixMul(float *Md, float *Nd, float *Pd, const int WIDTH)
{
    // Calculate global thread row and column indices
    int COL = threadIdx.x + blockIdx.x * blockDim.x;
    int ROW = threadIdx.y + blockIdx.y * blockDim.y;

    // Initialize the sum to zero
    float sum = 0.0f;

    // Check if within bounds
    if (ROW < WIDTH && COL < WIDTH) {
        // Perform the dot product for a single element
        for (int i = 0; i < WIDTH; i++) {
            sum += Md[ROW * WIDTH + i] * Nd[i * WIDTH + COL];
        }
        Pd[ROW * WIDTH + COL] = sum; // Store the result
    }
}