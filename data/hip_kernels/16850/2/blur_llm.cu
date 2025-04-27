#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void blur(int* B,int* G,int* R, int* RB,int* RG,int* RR, int* K, int rows, int cols, int krows, int kcols) {

    int index = blockIdx.x * blockDim.x + threadIdx.x; // Use blockDim.x for flexibility

    if (index >= rows*cols) // Correct boundary condition
        return;

    int pixel_row = index / cols;
    int pixel_col = index % cols; // Use modulo for clarity

    int k_sum = 0;
    int k_center_row = (krows - 1) / 2;
    int k_center_col = (kcols - 1) / 2;

    int sumB = 0, sumG = 0, sumR = 0; // Accumulators for RGB values

    for (int i = 0; i < krows; i++) {
        for (int j = 0; j < kcols; j++) {
            int kr = i - k_center_row;
            int kc = j - k_center_col;

            int pr = pixel_row + kr;
            int pc = pixel_col + kc;

            if (pr >= 0 && pr < rows && pc >= 0 && pc < cols) {
                int idx = pr * cols + pc;
                int kval = K[i * kcols + j]; // Use i and j for accessing kernel

                k_sum += kval;
                sumB += B[idx] * kval;
                sumG += G[idx] * kval;
                sumR += R[idx] * kval;
            }
        }
    }

    if (k_sum != 0) { // Avoid division by zero
        RB[index] = sumB / k_sum; // Normalized pixel values
        RG[index] = sumG / k_sum;
        RR[index] = sumR / k_sum;
    }
}