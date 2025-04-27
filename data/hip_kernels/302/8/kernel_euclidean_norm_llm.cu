#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_euclidean_norm(const double *vec, int numElements, double *answer)
{
    extern __shared__ double square[];  // one element per thread

    int i = threadIdx.x;  // numElements assumed to fit into one block
    square[i] = vec[i] * vec[i];

    __syncthreads();

    // Optimize reduction using parallel threads
    for (int stride = 1; stride < numElements; stride *= 2) {
        if (i % (2 * stride) == 0 && i + stride < numElements) {
            square[i] += square[i + stride];
        }
        
        __syncthreads();
    }

    // Store the result to answer
    if (i == 0) {
        *answer = sqrt(square[0]);
    }
}