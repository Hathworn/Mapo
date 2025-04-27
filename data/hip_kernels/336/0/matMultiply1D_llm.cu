#include "hip/hip_runtime.h"
#include "includes.h"

//#define NDEBUG

const static float eps = 1e-6;
const static size_t blocSize = 8;
const static size_t size = 1024;

__global__ void matMultiply1D(float* matA, float* matB, float* Dest, int dimensions)
{
    int i = threadIdx.x + blockIdx.x * blockDim.x;
    if (i < dimensions)
    {
        // Load a row of matA into shared memory to reduce global memory access.
        __shared__ float sharedMatA[blocSize][blocSize];

        for (int blockBase = 0; blockBase < dimensions; blockBase += blocSize)
        {
            // Load data from global mem to shared mem
            if (threadIdx.x + blockBase < dimensions)
            {
                sharedMatA[threadIdx.x][blockDim.x] = matA[i * dimensions + threadIdx.x + blockBase];
            }
            __syncthreads();

            for (int j = 0; j < dimensions; ++j)
            {
                float res = 0.0f;
                for (int k = 0; k < blocSize; ++k)
                {
                    if (k + blockBase < dimensions)
                    {
                        res += sharedMatA[k][threadIdx.x] * matB[(k + blockBase) * dimensions + j];
                    }
                }
                Dest[i * dimensions + j] = res;
            }
            __syncthreads();
        }
    }
}