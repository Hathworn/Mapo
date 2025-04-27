#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cudaSMaxForward_kernel(unsigned int size, float* input, float* maxVal, const unsigned int idx, unsigned int* argMax)
{
    // Calculate global index
    const unsigned int index = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;

    // Loop over elements with stride
    for (unsigned int i = index; i < size; i += stride) {
        // Update maxVal and argMax with atomic operation
        if (input[i] > maxVal[i]) {
            atomicMax(reinterpret_cast<int*>(maxVal + i), __float_as_int(input[i]));
            argMax[i] = idx;
        }
    }
}