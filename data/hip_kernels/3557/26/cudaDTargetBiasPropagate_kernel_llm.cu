#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cudaDTargetBiasPropagate_kernel(unsigned int size, const double bias, const double* inputs, const double* diffInputs, double* outputs)
{
    const unsigned int index = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;

    // Use shared memory for faster access
    __shared__ double sharedInputs[BLOCK_SIZE];
    __shared__ double sharedDiffInputs[BLOCK_SIZE];

    // Load inputs and diffInputs into shared memory
    if (index < size) {
        sharedInputs[threadIdx.x] = inputs[index];
        sharedDiffInputs[threadIdx.x] = diffInputs[index];
    }
    __syncthreads();

    // Ensure the computation only proceeds for valid index
    if (index < size) {
        outputs[index] = sharedInputs[threadIdx.x];
        if (sharedDiffInputs[threadIdx.x] > 0.0 && sharedInputs[threadIdx.x] > -bias) {
            outputs[index] += bias;
        }
    }
}