```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kBlockify(float* source, float* target, int numdims, int blocksize) {
    // Calculate the global thread ID
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = gridDim.x * blockDim.x; // Calculate stride for iteration

    // Iterate over data with a stride to ensure all elements are processed
    for (unsigned int target_ind = idx; target_ind < numdims; target_ind += stride) {
        const int block = target_ind / blocksize;
        target[blockIdx.x * numdims + target_ind] = source[blockIdx.x * numdims + block * blocksize];
    }
}