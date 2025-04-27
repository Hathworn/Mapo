#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void normCalc(float *d_A, float *d_B, int n) {
    int col = blockIdx.x * blockDim.x + threadIdx.x;
    if (col < n) {
        // Declare local variables to avoid shared memory bank conflicts
        float mu = 0.0f;
        float sigma = 0.0f;
        
        // Calculate mean (mu)
        for (int row = 0; row < n; row++){
            mu += d_A[col*n+row];
        }
        mu /= n;

        // Calculate standard deviation (sigma)
        for (int row = 0; row < n; row++){
            float diff = d_A[col*n+row] - mu;
            sigma += diff * diff; // Replaced powf with multiplication for efficiency
        }
        sigma = sqrt(sigma / n);

        // Normalize values
        for (int row = 0; row < n; row++) {
            if (sigma == 0.0f) {
                d_B[row*n+col] = 0.0f;
            } else {
                d_B[row*n+col] = (d_A[col*n+row] - mu) / sigma;
            }
        }
    }
}