#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void depthwise_conv3d_forward(int B, int N, int M, int C, int r, int K, const int* nnIndex, const int* nnCount, const int* binIndex, const float* input, const float* filter, float* output)
{
    // Launching threads to optimize memory access and parallel computation
    for(int i=blockIdx.x; i<B; i+=gridDim.x) 
    {
        // Use 2D block indexing for efficient memory access
        int tid = blockIdx.y * blockDim.x + threadIdx.x;
        int stride = blockDim.x * gridDim.y;

        for(int j=tid; j<M*(C*r); j+=stride) 
        {
            int cout = j % (C*r);  // output channel ID
            int cin = cout / r;    // input channel ID
            int m = j / (C*r);     // output point ID
            int nnSize = nnCount[i*M + m];

            // Loop over neighbor points
            for(int k=0; k<nnSize; k++) 
            {
                int n = nnIndex[i*M*K + m*K + k];  // input point ID
                int f = binIndex[i*M*K + m*K + k];

                // Accumulate results for each output element
                output[i*M*C*r + j] += input[i*N*C + n*C + cin] * filter[f*C*r + cout] / nnSize;
            }
        }
    }
}