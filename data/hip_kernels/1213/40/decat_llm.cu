#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void decat(float* output1, float* output2, float* output3, float* output4, size_t num1, size_t num2, size_t num3, size_t num4, size_t maxNum, float* input, const int numPerBatch)
{
    size_t i = blockDim.x * blockIdx.x + threadIdx.x;

    while(i < maxNum) {
        // Calculate batchIdx and batchOffset
        size_t batchIdx = i / numPerBatch;
        const int batchOffset = i % numPerBatch;

        // Use a tmp variable to reduce repetitive calculations
        if(batchOffset < num1) {
            output1[batchOffset + batchIdx * num1] = input[i];
        } 
        else if(batchOffset < num1 + num2) {
            output2[batchOffset - num1 + batchIdx * num2] = input[i];
        } 
        else if(batchOffset < num1 + num2 + num3) {
            output3[batchOffset - num1 - num2 + batchIdx * num3] = input[i];
        } 
        else {
            output4[batchOffset - num1 - num2 - num3 + batchIdx * num4] = input[i];
        }

        i += blockDim.x * gridDim.x; // Update i for next loop iteration
    }
}