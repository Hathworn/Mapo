#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cudaUpdateActivity_kernel(int * inputs, char * activity, unsigned int * firingRate, unsigned int * exampleFiringRate, int * totalOutput, unsigned long long int * firstEventTime, unsigned long long int * lastEventTime, unsigned int inputsDimX, unsigned int inputsDimY, unsigned int inputsDimZ, unsigned int long long timestamp)
{
    const unsigned int inputSize = inputsDimZ * inputsDimX * inputsDimY;
    const unsigned int batchInputOffset = blockIdx.z * inputSize;

    unsigned int inputIndex = threadIdx.x + blockDim.x * (threadIdx.y + blockDim.y * (blockIdx.x + gridDim.x * blockIdx.y));
    unsigned int inputStride = blockDim.x * blockDim.y * gridDim.x * gridDim.y;

    for (unsigned int i = inputIndex; i < inputsDimX * inputsDimY * inputsDimZ; i += inputStride) {
        unsigned int channel = i / (inputsDimX * inputsDimY);
        unsigned int yz = i % (inputsDimX * inputsDimY);
        unsigned int y = yz / inputsDimX;
        unsigned int x = yz % inputsDimX;

        if (channel < inputsDimZ) {
            unsigned int inputsIdx = x + y * inputsDimX + channel * inputsDimX * inputsDimY;
            int act = inputs[inputsIdx + batchInputOffset];
            unsigned int actAbs = abs(act);
            char spike = act == 0 ? 0 : act / abs(act);

            activity[inputsIdx + batchInputOffset] = spike;
            firingRate[inputsIdx + batchInputOffset] += actAbs;
            exampleFiringRate[inputsIdx + batchInputOffset] += actAbs;
            totalOutput[inputsIdx + batchInputOffset] += act;
        }
    }
}