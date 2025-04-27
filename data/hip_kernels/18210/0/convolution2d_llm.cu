#include "hip/hip_runtime.h"
#include "includes.h"
using namespace std;
#define eps 1e-4

__global__ void convolution2d(float *img, float *kernel, float* result, int n, int m, int kw, int kh, int out_n, int out_m, bool padding)
{
    int bx = blockIdx.x, by = blockIdx.y;
    int tx = threadIdx.x, ty = threadIdx.y;
    int x = bx * blockDim.x + tx;
    int y = by * blockDim.y + ty;
    int idx = y * out_m + x;

    // Check boundary condition once
    if (x < out_m && y < out_n) {
        float ret = 0.0f;
        int half_kw = kw / 2, half_kh = kh / 2;  // Pre-calculate halves for efficiency
        int base_x = padding ? x - half_kw : x;
        int base_y = padding ? y - half_kh : y;

        // Use shared memory for kernel to reduce global memory access
        __shared__ float shared_kernel[32][32];  // Assuming a maximum kernel size of 32x32
        if (tx < kw && ty < kh) {
            shared_kernel[ty][tx] = kernel[ty * kw + tx];
        }
        __syncthreads();  // Synchronize to ensure all kernel elements are loaded

        // Iterate over the kernel dimensions
        for (int i = 0; i < kw; i++) {
            for (int j = 0; j < kh; j++) {
                int cur_x = base_x + i;
                int cur_y = base_y + j;
                if (cur_x >= 0 && cur_x < n && cur_y >= 0 && cur_y < m) {
                    ret += img[cur_y * m + cur_x] * shared_kernel[j][i];  // Use shared memory
                }
            }
        }

        result[idx] = ret;
    }
}