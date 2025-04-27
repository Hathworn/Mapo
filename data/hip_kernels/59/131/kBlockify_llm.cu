#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kBlockify(float* source, float* target, int numdims, int blocksize) {
    const unsigned int idx = threadIdx.x + blockDim.x * blockIdx.x; // Compute global index
    const unsigned int stride = blockDim.x * gridDim.x; // Compute stride for grid-stride loop

    // Grid-stride loop to optimize memory access and improve parallelism
    for (unsigned int target_ind = idx; target_ind < numdims; target_ind += stride) {
        const int block = target_ind / blocksize;
        target[target_ind] = source[block * blocksize + (blockIdx.x * numdims / blocksize)]; // Cache source index calculation
    }
}