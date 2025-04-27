#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kBlockify(float* source, float* target, int numdims, int blocksize) {
    const unsigned int idx = threadIdx.x + blockIdx.x * blockDim.x; // Use global thread index
    const unsigned int stride = blockDim.x * gridDim.x; // Use grid-stride loop

    for (unsigned int target_ind = idx; target_ind < numdims; target_ind += stride) {
        const int block = target_ind / blocksize;
        target[target_ind] = source[block * blocksize]; // Efficient memory access
    }
}