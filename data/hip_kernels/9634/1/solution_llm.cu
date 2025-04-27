#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void solution(float* img, float* xbar, int w, int h, int nc) {
    // Calculate global thread index
    int x = threadIdx.x + blockDim.x * blockIdx.x;
    int y = threadIdx.y + blockDim.y * blockIdx.y;
    
    if (x < w && y < h) {
        // Calculate base index for thread
        int baseIdx = x + w * y;
        for (int z = 0; z < nc; z++) {
            // Directly compute global index using base index
            int i = baseIdx + w * h * z;
            img[i] = xbar[i];
        }
    }
}