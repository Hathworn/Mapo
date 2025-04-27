#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void GaussianEliminationGlobal(const int clusterSize, float *x, const float *diagonal_values, const float *non_diagonal_values, float *y, const int size)
{
    const int index = blockIdx.x * blockDim.x + threadIdx.x;
    const int gi = index * clusterSize;
    // Optimize: Use shared memory for the cluster matrix within a block
    __shared__ float matrix[180][180];

    // Initialize matrix with zeros and set diagonal values
    for (int i = 0; i < clusterSize; ++i) {
        for (int j = 0; j < clusterSize; ++j) {
            matrix[i][j] = 0.0f;
        }
        matrix[i][i] = diagonal_values[gi + i];
    }

    // Set non-diagonal values
    for (int i = 0; i < clusterSize - 1; ++i) {
        matrix[i][i + 1] = non_diagonal_values[2 * (gi + i) + 1];
        matrix[i + 1][i] = non_diagonal_values[2 * (gi + i) + 2];
    }

    // Triangle form (Gaussian elimination)
    for (int i = 0; i < clusterSize; ++i) {
        for (int j = i + 1; j < clusterSize; ++j) {
            float ratio = matrix[j][i] / matrix[i][i];
            for (int k = 0; k < clusterSize; ++k) {
                matrix[j][k] -= matrix[i][k] * ratio;
            }
            y[gi + j] -= y[gi + i] * ratio;
        }
    }

    __syncthreads();

    // Back substitution
    for (int i = clusterSize - 1; i >= 0; --i) {
        float current = 0.0f;
        for (int j = i; j < clusterSize; ++j) {
            current += matrix[i][j] * x[gi + j];
        }
        x[gi + i] = (y[gi + i] - current) / matrix[i][i];
    }
}