#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void concat(float* input1, float* input2, float* input3, float* input4, size_t num1, size_t num2, size_t num3, size_t num4, size_t maxNum, float* output, const int numPerBatch)
{
    size_t i = blockDim.x * blockIdx.x + threadIdx.x;
    const size_t stride = blockDim.x * gridDim.x; // Calculate stride for iteration

    while (i < maxNum) {
        size_t batchIdx = i / numPerBatch; // Determine batch index
        const int batchOffset = i % numPerBatch; // Offset within the batch

        // Utilize conditional execution to improve performance
        if (batchOffset < num1) {
            output[i] = input1[batchOffset + batchIdx * num1];
        }
        else if (batchOffset < (num1 + num2)) {
            output[i] = input2[(batchOffset - num1) + batchIdx * num2];
        }
        else if (batchOffset < (num1 + num2 + num3)) {
            output[i] = input3[(batchOffset - (num1 + num2)) + batchIdx * num3];
        }
        else {
            output[i] = input4[(batchOffset - (num1 + num2 + num3)) + batchIdx * num4];
        }

        i += stride; // Move to the next iteration position using stride
    }
}