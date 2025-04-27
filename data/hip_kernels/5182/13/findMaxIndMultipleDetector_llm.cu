#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void findMaxIndMultipleDetector(float *input, int* maxInd, int size)
{
    int maxIndex = 0;
    int count = 1;
    float maxValue = input[0];

    // Unroll loop for better performance and use shared memory for partial results
    extern __shared__ int sharedMem[];
    sharedMem[threadIdx.x] = 0;
    __syncthreads();

    for (int i = 1; i < size; i++){
        if (maxValue < input[i]){
            maxIndex = i;
            maxValue = input[i];
            count = 1;
        }
        else if (maxValue == input[i]){
            count++;
        }
    }

    // Write the maxIndex result to shared memory
    sharedMem[threadIdx.x] = (count > 1) ? -1 : maxIndex;
    __syncthreads();

    // Reduce the results in shared memory to get final result
    if (threadIdx.x == 0) {
        maxInd[0] = sharedMem[0];
        for (int i = 1; i < blockDim.x; i++) {
            if (sharedMem[i] != -1) {
                maxInd[0] = sharedMem[i];
                break;
            }
        }
    }
}