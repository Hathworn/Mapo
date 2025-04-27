#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void solution(float* img, float* xbar, int w, int h, int nc) {
    int x = threadIdx.x + blockDim.x * blockIdx.x;
    int y = threadIdx.y + blockDim.y * blockIdx.y;

    if (x < w && y < h) {
        // Unrolling loop for better performance
        int base_index = x + w * y;
        #pragma unroll
        for (int z = 0; z < nc; z++) {
            int i = base_index + w * h * z;
            img[i] = xbar[i];
        }
    }
}