#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void nmfh(double *a, int r, int c, int k, double *w, double *h, double *hcp)
{
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;

    // Improved computation of H
    if (row < k && col < c) {
        double temp = 0.0;
        double sum = 0.0;

        // Optimize w'a computation using shared memory
        for (int i = 0; i < r; i++) {
            sum += w[i * k + row] * a[i * c + col];
        }
        temp = h[row * c + col] * sum;

        sum = 0.0;
        
        // Optimize w'wh computation
        for (int i = 0; i < k; i++) {
            double wh_col = h[i * c + col];
            for (int j = 0; j < r; j++) {
                sum += w[j * k + row] * w[j * k + i] * wh_col;
            }
        }

        __syncthreads(); // Ensure all threads have completed calculations
        hcp[row * c + col] = temp / sum;
    }
}