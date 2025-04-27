#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void findMaxIndMultipleDetector(float *input, int* maxInd, int size)
{
    __shared__ float sharedMaxValue;
    __shared__ int sharedMaxIndex;

    if(threadIdx.x == 0) {
        sharedMaxValue = input[0];
        sharedMaxIndex = 0;
    }
    __syncthreads();

    for (int i = threadIdx.x; i < size; i += blockDim.x) {
        if (input[i] > sharedMaxValue) {
            atomicExch(&sharedMaxValue, input[i]);
            atomicExch(&sharedMaxIndex, i);
        }
    }
    __syncthreads();

    if(threadIdx.x == 0) {
        int count = 0;
        for (int i = 0; i < size; i++) {
            if (input[i] == sharedMaxValue) {
                count++;
            }
        }
        if(count > 1)
            maxInd[0] = -1;
        else
            maxInd[0] = sharedMaxIndex;
    }
}