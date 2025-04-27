#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void mean_interpolate_forward(int B, int N, int M, int C, int K, const int* nnIndex, const int* nnCount, const float* input, float* output)
{
    int i = blockIdx.x;
    int j = threadIdx.x;

    // Iterate over batches
    while(i < B) 
    {
        // Iterate over elements
        while(j < N * C) 
        {
            int n = j / C;
            int c = j % C;
            int nnSize = nnCount[i * N + n];
            float sum = 0.0f;

            // Accumulate neighbor contributions
            for(int k = 0; k < nnSize; k++)
            {
                int m = nnIndex[i * N * K + n * K + k];
                sum += input[i * M * C + m * C + c];
            }

            // Write the averaged value to output
            if (nnSize > 0)
            {
                output[i * N * C + j] = sum / nnSize;
            }
            
            j += blockDim.x; // Move to the next element
        }
        
        i += gridDim.x; // Move to the next batch
    }
}