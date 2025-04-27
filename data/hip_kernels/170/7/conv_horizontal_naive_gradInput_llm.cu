#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void conv_horizontal_naive_gradInput(const int n, float *dx, const float *dy, const float *w, const int oH, const int oW, const int kL)
{
    // Use shared memory to store weights for faster access
    extern __shared__ float shared_w[];
    
    for (int i = threadIdx.x; i < kL; i += blockDim.x) {
        shared_w[i] = w[blockIdx.x * kL + i];
    }
    __syncthreads();
    
    for (int i = blockIdx.x * blockDim.x + threadIdx.x; i < n; i += blockDim.x * gridDim.x) {
        int iW = oW + kL - 1;
        int col = i % iW;
        int dy_offset = (i / iW) * oW + col;
        
        int k_begin = max(0, col - oW + 1);
        int k_end = min(kL, col + 1);

        float sum = 0.0f;
        // Loop unrolling for improved throughput
        for (int k = k_begin; k < k_end; k++) {
            sum += shared_w[k] * dy[dy_offset - k];
        }
        dx[i] = sum;
    }
}