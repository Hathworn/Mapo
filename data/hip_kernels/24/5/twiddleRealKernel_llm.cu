#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void twiddleRealKernel(float *wr, float *w, int N)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;

    // Use loop unrolling to improve performance
    for (; idx < N * N; idx += stride) {
        int row = idx / N;
        int col = idx % N;

        if (col == 0 || row == 0) {
            wr[idx] = 1.0f;
        } else {
            int index = (row * col) % N;
            wr[idx] = w[index * 2];
        }
    }
}