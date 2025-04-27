#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void conv_horizontal_naive_gradInput(const int n, float *dx, const float *dy, const float *w, const int oH, const int oW, const int kL)
{
    // Calculate global thread ID
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int totalThreads = blockDim.x * gridDim.x;  // Total number of threads

    // Use a loop with stride equal to the total number of threads
    while (i < n) {
        int iW = oW + kL - 1;
        int col = i % iW;
        int dy_offset = (i / iW) * oW + i % iW;
        int w_offset = (i / (iW * oH)) * kL;

        int k_begin = max(0, col - oW + 1);
        int k_end = min(kL, col + 1);

        dx[i] = 0.0f;
        for (int k = k_begin; k < k_end; k++) {
            dx[i] += w[w_offset + k] * dy[dy_offset - k];
        }

        i += totalThreads;  // Increment by total number of threads
    }
}