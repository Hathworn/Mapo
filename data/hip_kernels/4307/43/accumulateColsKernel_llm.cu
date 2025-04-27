#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void accumulateColsKernel(float *input, float *output, int channels, int h, int w) {
    // compute global column index
    int colIdx = blockDim.x * blockIdx.x + threadIdx.x;

    if (colIdx < channels * w) {
        // compute channel and its local column index
        int channel = colIdx / w;
        int localColIdx = colIdx % w + 1; // 1-indexed
    
        // adjust pointers to the start of the current channel
        input  += channel * h * w;
        output += channel * (h+1) * (w+1);

        output[localColIdx] = 0; // first element of every column is always zero
        double sum = 0.0;

        for (int i = 1; i <= h; ++i) {
            sum += static_cast<double>(input[(i-1) * w + localColIdx - 1]);
            output[i * (w+1) + localColIdx] = static_cast<float>(sum);
        }
    }
}