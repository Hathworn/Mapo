#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cudaUpdateMetrics_kernel(float *inputs, int *activity, long long unsigned int *firingRate, long long unsigned int *totalFiringRate, long long int *outputsActivity, long long int *totalOutputsActivity, unsigned int inputsDimX, unsigned int inputsDimY, unsigned int inputsDimZ)
{
    const unsigned int inputSize = inputsDimZ * inputsDimX * inputsDimY;
    const unsigned int batchInputOffset = blockIdx.z * inputSize;
    
    // Using shared memory and launch optimally within dimensions
    extern __shared__ int sharedMem[];

    unsigned int channel = blockIdx.x;
    unsigned int y = threadIdx.y;
    unsigned int x = threadIdx.x;

    if (channel < inputsDimZ && y < inputsDimY && x < inputsDimX) {
        const unsigned int inputsIdx = x + y * inputsDimX + channel * inputsDimX * inputsDimY;

        // Load data to shared memory
        sharedMem[threadIdx.y * blockDim.x + threadIdx.x] = round(inputs[inputsIdx + batchInputOffset]);
        __syncthreads();

        int value = sharedMem[threadIdx.y * blockDim.x + threadIdx.x];
        unsigned int event = value == 0 ? 0 : 1;

        activity[inputsIdx + batchInputOffset] = event;
        firingRate[inputsIdx + batchInputOffset] += event;
        totalFiringRate[inputsIdx + batchInputOffset] += event;
        outputsActivity[inputsIdx + batchInputOffset] += value;
        totalOutputsActivity[inputsIdx + batchInputOffset] += value;
    }
}