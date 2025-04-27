#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void accumulateColsInplaceTransposedKernel(float *input, int channels, int h, int w) {
    // Calculate global column index for this thread
    int colIdx = BLOCK_SIZE * BLOCK_SIZE * blockIdx.x + threadIdx.x;

    // Check if column index is within bounds
    if (colIdx < channels * h) {
        // Zero the (0,0) corner of the output
        input[(colIdx / h) * (h+1)] = 0;

        // Adjust column index for (h+1)-array indexing
        colIdx += colIdx / h + 1;

        // Initialize first element of every column to zero
        input[colIdx] = 0;

        // Use double precision for accumulation to avoid precision loss
        double sum = 0;

        // Loop through elements, accumulate and update values in-place
        for (int i = 1; i <= w; ++i) {
            float *currentElement = &input[i * channels * (h+1) + colIdx];
            sum += static_cast<double>(*currentElement);  // Accumulate sum with double precision
            *currentElement = static_cast<float>(sum);    // Store result back in float
        }
    }
}