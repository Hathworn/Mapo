#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sumScore(double *score, int full_size, int half_size)
{
    int index = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x;

    // Ensure threads do not go out of bounds
    if (index < half_size) {
        // Apply stride only if necessary
        for (int i = index; i < half_size; i += stride) {
            // Use shared memory for partial scores 
            score[i] += (i + half_size < full_size) ? score[i + half_size] : 0;
        }
    }
}