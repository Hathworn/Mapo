#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void blur(int* B, int* G, int* R, int* RB, int* RG, int* RR, int* K, int rows, int cols, int krows, int kcols) {

    // Use shared memory for kernel
    __shared__ int sK[11*11]; // Assuming maximum kernel size of 11x11. Adjust if necessary.
    int tid = threadIdx.y * blockDim.x + threadIdx.x;

    if (tid < krows * kcols) {
        sK[tid] = K[tid];
    }

    __syncthreads();

    int index = blockIdx.x * 1024 + threadIdx.x;

    if (index >= rows * cols) return;

    int pixel_row = index / cols;
    int pixel_col = index - pixel_row * cols;

    int k_center_row = (krows - 1) / 2;
    int k_center_col = (kcols - 1) / 2;

    int k_sum = 0;
    int rb_accum = 0;
    int rg_accum = 0;
    int rr_accum = 0;

    for (int i = 0; i < krows; i++) {
        for (int j = 0; j < kcols; j++) {
            int kr = i - k_center_row;
            int kc = j - k_center_col;

            int pr = pixel_row + kr;
            int pc = pixel_col + kc;

            if (pr >= 0 && pr < rows && pc >= 0 && pc < cols) {
                int idx = pr * cols + pc;
                int k_value = sK[i * kcols + j];

                k_sum += k_value;
                rb_accum += B[idx] * k_value;
                rg_accum += G[idx] * k_value;
                rr_accum += R[idx] * k_value;
            }
        }
    }

    if (k_sum != 0) {
        RB[index] = rb_accum / k_sum;
        RG[index] = rg_accum / k_sum;
        RR[index] = rr_accum / k_sum;
    }
}