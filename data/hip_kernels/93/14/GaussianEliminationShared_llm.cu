#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void GaussianEliminationShared(const int clusterSize, float *x, const float *diagonal_values, const float *non_diagonal_values, float *y)
{
    const int index = blockIdx.x;

    // Use dynamic shared memory allocation
    extern __shared__ float shared_m[];

    // Initialize shared memory
    for (int i = threadIdx.x; i < clusterSize * clusterSize; i += blockDim.x)
    {
        shared_m[i] = 0;
    }
    __syncthreads();

    // Load diagonal values
    for (int i = threadIdx.x; i < clusterSize; i += blockDim.x)
    {
        shared_m[i * clusterSize + i] = diagonal_values[clusterSize * index + i];
    }

    // Load non-diagonal values
    for (int i = threadIdx.x; i < clusterSize - 1; i += blockDim.x)
    {
        shared_m[i * clusterSize + i + 1] = non_diagonal_values[clusterSize * index * 2 + 2 * i + 1];
        shared_m[(i + 1) * clusterSize + i] = non_diagonal_values[clusterSize * index * 2 + 2 * i + 2];
    }
    __syncthreads();

    // Triangle form
    for (int i = 0; i < clusterSize; ++i)
    {
        if (threadIdx.x == 0)
        {
            for (int j = i + 1; j < clusterSize; ++j)
            {
                double ratio = shared_m[j * clusterSize + i] / shared_m[i * clusterSize + i];
                for (int k = 0; k < clusterSize; ++k)
                {
                    shared_m[j * clusterSize + k] -= shared_m[i * clusterSize + k] * ratio;
                }
                y[clusterSize * index + j] -= y[clusterSize * index + i] * ratio;
            }
        }
        __syncthreads();
    }

    // Back substitution
    for (int i = clusterSize - 1; i > -1; --i)
    {
        double current = 0;
        for (unsigned int j = i + 1; j < clusterSize; ++j)
        {
            current += shared_m[i * clusterSize + j] * x[clusterSize * index + j];
        }
        if (threadIdx.x == 0)
        {
            x[clusterSize * index + i] = (y[clusterSize * index + i] - current) / shared_m[i * clusterSize + i];
        }
        __syncthreads();
    }
}