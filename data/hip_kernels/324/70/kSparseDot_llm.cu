#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kSparseDot(int m, int n, int k, float *data, int* indptr, int* indices, float *dense_data, float* target, float beta, float alpha) {
    const unsigned int row = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int col = blockIdx.y * blockDim.y + threadIdx.y;

    if (row < m && col < n) {
        const int start = indptr[row];
        const int end = indptr[row + 1];
        float sum = 0.f;

        // Unroll inner loop for better performance
        for (int i = start; i < end; i += 4) {
            sum += data[i] * dense_data[col * k + indices[i]];
            if (i + 1 < end) sum += data[i + 1] * dense_data[col * k + indices[i + 1]];
            if (i + 2 < end) sum += data[i + 2] * dense_data[col * k + indices[i + 2]];
            if (i + 3 < end) sum += data[i + 3] * dense_data[col * k + indices[i + 3]];
        }

        const int pos = col * m + row;
        // Combined beta condition using ternary operator
        target[pos] = alpha * sum + beta * target[pos] * (beta != 0);
    }
}