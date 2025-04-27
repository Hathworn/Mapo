#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void MergeRank(float * d_input, float * d_output)
{
    // Using shared memory to store input values for faster access
    __shared__ float shared_input[4096];

    int indexA = blockIdx.x * blockDim.x + threadIdx.x;
    int indexB = indexA + 2048;

    // Loading inputs to shared memory
    shared_input[threadIdx.x] = d_input[indexA];
    shared_input[threadIdx.x + 2048] = d_input[indexB];
    __syncthreads();

    float temp1 = shared_input[threadIdx.x];
    float temp2 = shared_input[threadIdx.x + 2048];

    int rank1 = 2048;
    int rank2 = 0;

    // Parallel binary search for better performance
    for (int stride = 1024; stride > 0; stride >>= 1) {
        int pos = rank1 - stride;
        if (pos >= 0 && shared_input[pos] < temp1) {
            rank1 = pos;
        }

        pos = rank2 + stride;
        if (pos < 2048 && shared_input[pos] < temp2) {
            rank2 = pos;
        }
    }

    __syncthreads();
    d_output[indexA + rank1 + 1] = temp1;
    d_output[indexB + rank2 + 1] = temp2;
}