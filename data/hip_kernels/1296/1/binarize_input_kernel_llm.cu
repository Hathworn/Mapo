#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void binarize_input_kernel(float *input, int n, int size, float *binary)
{
    int s = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    if (s >= size) return;

    float mean = 0.0f;
    // Loop unrolling to reduce loop overhead and improve data reuse
    for (int i = 0; i < n; i += 4) {
        if (i < n) mean += fabsf(input[i * size + s]);
        if (i + 1 < n) mean += fabsf(input[(i + 1) * size + s]);
        if (i + 2 < n) mean += fabsf(input[(i + 2) * size + s]);
        if (i + 3 < n) mean += fabsf(input[(i + 3) * size + s]);
    }
    mean /= n;

    for (int i = 0; i < n; ++i) {
        binary[i * size + s] = (input[i * size + s] > 0) ? mean : -mean;
    }
}