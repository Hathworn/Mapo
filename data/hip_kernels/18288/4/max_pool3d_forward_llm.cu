#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void max_pool3d_forward(int B, int N, int M, int C, int K, const int* nnIndex, const int* nnCount, const float* input, float* output, int* maxIndex)
{
    int i = blockIdx.x;
    while(i < B) {
        int j = threadIdx.x;
        while(j < M * C) {
            int m = j / C;
            int c = j % C;
            int nnSize = nnCount[i * M + m];
            
            float maxVal = -FLT_MAX;
            int maxIdx = -1;

            for(int k = 0; k < nnSize; k++) {
                int n = nnIndex[i * M * K + m * K + k];
                float val = input[i * N * C + n * C + c];
                
                if (val > maxVal) {
                    maxVal = val;
                    maxIdx = n;
                }
            }

            output[i * M * C + j] = maxVal;
            maxIndex[i * M * C + j] = maxIdx;

            j += blockDim.x;
        }
        i += gridDim.x;
    }
}