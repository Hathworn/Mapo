#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void nmfw(double *a, int r, int c, int k, double *w, double *h, double *wcp)
{
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;

    // Compute W
    if (col < k && row < r) {
        double sum_ah = 0.0;
        double sum_whh = 0.0;

        // Calculate ah'
        for (int i = 0; i < c; i++) {
            sum_ah += a[row * c + i] * h[col * c + i];
        }

        double temp = w[row * k + col] * sum_ah;

        // Calculate whh'
        for (int i = 0; i < c; i++) {
            for (int j = 0; j < k; j++) {
                sum_whh += w[row * k + j] * h[j * c + i] * h[col * c + i];
            }
        }

        // Update result
        if (sum_whh != 0.0) {
            wcp[row * k + col] = temp / sum_whh;
        } else {
            wcp[row * k + col] = 0.0; // Handle division by zero
        }
    }
}