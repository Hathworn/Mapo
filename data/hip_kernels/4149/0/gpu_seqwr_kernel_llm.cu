#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_seqwr_kernel(int *buffer, size_t reps, size_t elements)
{
    size_t step = blockDim.x * gridDim.x; // Precompute step outside the loop for efficiency
    size_t ofs = blockIdx.x * blockDim.x + threadIdx.x; // Calculate initial offset

    for(size_t j = 0; j < reps; j++) {
        for(size_t index = ofs; index < elements; index += step) { // Unroll inner loop for better performance
            buffer[index] = 0;
        }
    }
}