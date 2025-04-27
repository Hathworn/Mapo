#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cudaUpdateBatchFiringRate_kernel(unsigned int * firingRate, unsigned int * batchFiringRate, unsigned int inputsDimX, unsigned int inputsDimY, unsigned int inputsDimZ, unsigned int batchSize)
{
    const unsigned int inputSize = inputsDimZ * inputsDimX * inputsDimY;
    const unsigned int channel = blockIdx.x;
    const unsigned int sy = threadIdx.y;
    const unsigned int sx = threadIdx.x;

    if (channel < inputsDimZ && sy < inputsDimY && sx < inputsDimX) {
        // Compute the input index for the current thread
        const unsigned int inputsIdx = channel * inputsDimX * inputsDimY + sy * inputsDimX + sx;

        unsigned int batchSum = 0;
        for (unsigned int batch = 0; batch < batchSize; ++batch) {
            const unsigned int batchInputOffset = batch * inputSize;
            batchSum += firingRate[inputsIdx + batchInputOffset];
        }
        batchFiringRate[inputsIdx] = batchSum;
    }
}