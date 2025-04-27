#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void GaussianEliminationShared(const int clusterSize,float *x, const float *diagonal_values , const float *non_diagonal_values ,float *y )
{
    const int index = blockIdx.x;
    
    __shared__ float shared_m[9][9]; // size of cluster

    // Initialize shared memory with diagonal and non-diagonal values
    for(int i = 0; i < clusterSize; ++i)
    {
        for(int j = 0; j < clusterSize; ++j)
        {
            shared_m[i][j] = (i == j) ? diagonal_values[clusterSize * index + i] : 0;
        }
    }
    
    for(int i = 0; i < clusterSize - 1; ++i)
    {
        shared_m[i][i + 1] = non_diagonal_values[clusterSize * index * 2 + 2 * i + 1];
        shared_m[i + 1][i] = non_diagonal_values[clusterSize * index * 2 + 2 * i + 2];
    }

    // Triangle form transformation using Gaussian elimination
    for (int i = 0; i < clusterSize; ++i)
    {
        // For each row below the current one
        for (int j = i + 1; j < clusterSize; ++j)
        {
            // Calculate elimination ratio
            float ratio = shared_m[j][i] / shared_m[i][i];
            
            for(int k = i; k < clusterSize; ++k)
            {
                // Perform elimination on matrix
                shared_m[j][k] -= shared_m[i][k] * ratio;
            }
            
            // Perform elimination on coefficient vector
            y[clusterSize * index + j] -= y[clusterSize * index + i] * ratio;
        }
    }

    __syncthreads();

    // Back substitution to solve x
    for (int i = clusterSize - 1; i >= 0; --i)
    {
        float sum = 0.0f;
        
        for (int j = i + 1; j < clusterSize; ++j)
        {
            sum += shared_m[i][j] * x[clusterSize * index + j];
        }
        
        x[clusterSize * index + i] = (y[clusterSize * index + i] - sum) / shared_m[i][i];
    }
}