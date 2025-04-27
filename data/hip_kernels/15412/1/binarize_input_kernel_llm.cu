#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void binarize_input_kernel(float *input, int n, int size, float *binary)
{
    int s = blockIdx.x * blockDim.x + threadIdx.x;  // Combine blockIdx.x and threadIdx.x to utilize warp execution
    if (s >= size) return;

    float mean = 0.0f;
    for (int i = 0; i < n; ++i) {
        mean += fabs(input[i * size + s]);
    }
    mean /= n;  // Pre-compute mean outside the inner loop

    for (int i = 0; i < n; ++i) {
        binary[i * size + s] = (input[i * size + s] > 0) ? mean : -mean;
    }
}