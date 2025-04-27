#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void accumulateRowsKernel(float *input, float *output, int channels, int h, int w) {
    int globalRowIdx = blockIdx.x * blockDim.x + threadIdx.x; // Simplified block index calculation

    if (globalRowIdx < channels * h) {
        float *outputRow = output + (globalRowIdx + globalRowIdx / h + 1) * (w + 1) + 1;
        outputRow[-1] = 0;

        // Using shared memory to enhance memory access pattern
        extern __shared__ float sharedSum[];
        double sum = 0.0;

        for (int i = 0; i < w; ++i) {
            sum += input[globalRowIdx * w + i];
            sharedSum[threadIdx.x] = sum; // Store intermediate sum in shared memory
            __syncthreads(); // Ensure all threads have written the shared memory

            outputRow[i] = static_cast<float>(sharedSum[threadIdx.x]); // Write from shared memory to global
        }

        // Zero the (0,0) corner of the output separately
        if (threadIdx.x == 0) {
            output[(globalRowIdx / h) * (w + 1) * (h + 1)] = 0;
        }
    }
}