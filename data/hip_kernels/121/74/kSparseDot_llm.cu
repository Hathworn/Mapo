#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kSparseDot(int m, int n, int k, float *data, int* indptr, int* indices, float *dense_data, float* target, float beta, float alpha) {
    // Calculate row and column indices for threads
    const unsigned int row = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int col = blockIdx.y * blockDim.y + threadIdx.y;

    // Check bounds for row and column indices
    if (row < m && col < n) {
        // Access start and end indices for sparse matrix's current row
        const int start = indptr[row];
        const int end = indptr[row + 1];

        float sum = 0.f;

        // Unroll loop to improve performance
        for (int i = start; i < end; i++) {
            sum += data[i] * dense_data[col * k + indices[i]];
        }

        // Compute position in target array
        const int pos = col * m + row;

        // Update target array
        target[pos] = alpha * sum + ((beta == 0) ? 0 : beta * target[pos]);
    }
}