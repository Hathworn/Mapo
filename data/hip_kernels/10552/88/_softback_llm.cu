#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void _softback(int nrows, int ncols, float *y, float *dy) {
    // Using shared memory to optimize access memory speed.
    extern __shared__ float sharedMem[];

    float y0, sum;
    int i0, i1;
    int col = threadIdx.x + blockIdx.x * blockDim.x;

    while (col < ncols) {
        i0 = col * nrows;
        i1 = i0 + nrows;
        y0 = -INFINITY;
        
        // Load data to shared memory to reduce global memory access.
        for (int i = threadIdx.x; i < nrows; i += blockDim.x) {
            sharedMem[i] = y[i0 + i];
        }
        __syncthreads();

        // Find max value for numerical stability (in shared memory).
        for (int i = 0; i < nrows; i++) {
            if (sharedMem[i] > y0) {
                y0 = sharedMem[i];
            }
        }

        sum = 0;
        // Compute exponential scores and sum (in shared memory).
        for (int i = threadIdx.x; i < nrows; i += blockDim.x) {
            sharedMem[i] = exp(sharedMem[i] - y0);
            sum += sharedMem[i];
        }

        // Use block-level reduction to sum all values.
        __syncthreads();
        float blockSum = atomicAdd(&sum, 0.0f);
        __syncthreads();

        // Normalize probabilities and compute gradient (in shared memory).
        for (int i = threadIdx.x; i < nrows; i += blockDim.x) {
            sharedMem[i] /= blockSum;
            dy[i0 + i] = (sharedMem[i] - dy[i0 + i]) / ncols;
            y[i0 + i] = sharedMem[i];
        }

        col += blockDim.x * gridDim.x;
    }
}