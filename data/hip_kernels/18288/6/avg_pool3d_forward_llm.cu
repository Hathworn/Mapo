#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void avg_pool3d_forward(int B, int N, int M, int C, int K, const int* nnIndex, const int* nnCount, const float* input, float* output)
{
    // Utilize shared memory for nnCount to reduce global memory access
    extern __shared__ int shared_nnCount[];

    for (int i = blockIdx.x; i < B; i += gridDim.x)
    {
        // Load nnCount into shared memory
        if (threadIdx.x < M)
        {
            shared_nnCount[i * M + threadIdx.x] = nnCount[i * M + threadIdx.x];
        }
        __syncthreads();

        for (int j = threadIdx.x; j < M * C; j += blockDim.x)
        {
            int m = j / C;
            int c = j % C;
            int nnSize = shared_nnCount[i * M + m];

            // Use a local register to accumulate results before writing to global memory
            float sum = 0.0f;
            for (int k = 0; k < nnSize; k++)
            {
                int n = nnIndex[i * M * K + m * K + k];
                sum += input[i * N * C + n * C + c];
            }
            output[i * M * C + j] = sum / nnSize;
        }
    }
}