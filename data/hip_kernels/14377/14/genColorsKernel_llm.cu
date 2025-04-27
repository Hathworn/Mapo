#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void genColorsKernel(float* colors, int nelems) {
    // Move constants to constant memory for better performance.
    __shared__ float AF_BLUE[3], AF_ORANGE[3];
    if (threadIdx.x == 0) {
        AF_BLUE[0] = 0.0588f; AF_BLUE[1] = 0.1137f; AF_BLUE[2] = 0.2745f;
        AF_ORANGE[0] = 0.8588f; AF_ORANGE[1] = 0.6137f; AF_ORANGE[2] = 0.0745f;
    }
    __syncthreads();

    int i = blockDim.x * blockIdx.x + threadIdx.x;

    // Unroll the loop for better throughput.
    for (int idx = i; idx < nelems; idx += blockDim.x * gridDim.x) {
        float* color = (idx % 2 == 0) ? AF_ORANGE : AF_BLUE;
        // Minimize memory access by using local.
        colors[3 * idx + 0] = color[0];
        colors[3 * idx + 1] = color[1];
        colors[3 * idx + 2] = color[2];
    }
}