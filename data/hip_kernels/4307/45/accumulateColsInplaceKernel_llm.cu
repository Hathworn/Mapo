#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void accumulateColsInplaceKernel(float *input, int channels, int h, int w) {
    // Optimization: Use shared memory to store partial sums
    extern __shared__ double sharedSum[];

    // global column index (of all `channels * w` columns in this image)
    int colIdx = blockDim.x * blockIdx.x + threadIdx.x;

    if (colIdx < channels * w) {
        input += (colIdx / w) * (h + 1) * (w + 1); // jump to current channel
        colIdx %= w; // switch to local column index,
        ++colIdx;    // it's 1-indexed because first output column is always zero

        input[colIdx] = 0; // first element of every column is always zero
        double sum = 0;

        for (int i = 1; i <= h; ++i) {
            float *currentElement = &input[i * (w + 1) + colIdx];
            sum += static_cast<double>(*currentElement);
            sharedSum[threadIdx.x] = sum; // Store sum in shared memory
            __syncthreads(); // Ensure all threads have finished updating shared memory
            *currentElement = static_cast<float>(sharedSum[threadIdx.x]); // Use value from shared memory
        }
    }
}