#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void GaussianEliminationGlobal(const int clusterSize, float *x, const float *diagonal_values, const float *non_diagonal_values, float *y, const int size)
{
    const int index = blockIdx.x * blockDim.x + threadIdx.x;
    const int gi = index * clusterSize;

    // Use shared memory for faster access, as matrix size is now manageable
    __shared__ float matrix[180][180];

    // Initialize matrix
    for (int i = gi; i < gi + clusterSize; ++i)
    {
        for (int j = gi; j < gi + clusterSize; ++j)
        {
            matrix[i][j] = 0;
        }
        matrix[i][i] = diagonal_values[i];
    }
    // Fill non-diagonal values
    for (int i = gi; i < gi + clusterSize - 1; ++i)
    {
        matrix[i][i+1] = non_diagonal_values[2*i+1];
        matrix[i+1][i] = non_diagonal_values[2*i+2];
    }

    // Forward elimination to triangular form
    for (int i = gi; i < gi + clusterSize; ++i)
    {
        for (int j = i+1; j < gi + clusterSize; ++j)
        {
            // Calculate ratio for elimination
            float ratio = matrix[j][i] / matrix[i][i];
            for (int k = gi; k < gi + clusterSize; ++k)
            {
                matrix[j][k] -= matrix[i][k] * ratio;
            }
            y[j] -= y[i] * ratio;
        }
    }
    __syncthreads();

    // Back substitution
    for (int i = gi + clusterSize - 1; i >= gi; --i)
    {
        float current = 0;
        for (int j = i+1; j < gi + clusterSize; ++j)
        {
            current += matrix[i][j] * x[j];
        }
        x[i] = (y[i] - current) / matrix[i][i];
    }
}