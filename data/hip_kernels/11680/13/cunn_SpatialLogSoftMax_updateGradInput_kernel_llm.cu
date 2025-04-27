#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cunn_SpatialLogSoftMax_updateGradInput_kernel(float *gradInput, float *output, float *gradOutput, int classSize, int height, int width)
{
    int batchIndex = blockIdx.x;
    int index = threadIdx.x + blockDim.x * blockIdx.y; // Add blockIdx.y for better workload distribution

    // Loop with stride to handle more work items with a single kernel launch
    int stride = blockDim.x * gridDim.y;
    while (index < height * width) {
        int y = index / width;
        int x = index % width;

        if (y < height) { // Ensure valid y index range
            // Calculate output starting index in CUDA layout (B x H x W x C)
            int outputStartIndex = (height * width * classSize) * batchIndex + (width * classSize) * y + classSize * x;

            float sum = 0.0f;
            for (int i = 0; i < classSize; i++) {
                sum += gradOutput[outputStartIndex + i];
            }

            for (int i = 0; i < classSize; i++) {
                // Calculate input index in Torch layout (B x C x H x W)
                int inputIndex = (classSize * height * width) * batchIndex + (height * width) * i + width * y + x;
                gradInput[inputIndex] = gradOutput[outputStartIndex + i] - __expf(output[outputStartIndex + i]) * sum;
            }
        }
        index += stride; // Ensure all possible indices are covered by incrementing by stride
    }
}