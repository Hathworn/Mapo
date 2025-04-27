#include "hip/hip_runtime.h"
#include "includes.h"

// Launch this kernel with a single block and numElements threads
__global__ void kernel_euclidean_norm(const double *vec, int numElements, double *answer)
{
    extern __shared__ double square[];

    int i = threadIdx.x;

    // Compute square of each element and store
    if (i < numElements) {
        square[i] = vec[i] * vec[i];
    } else {
        square[i] = 0.0; // Ensure no garbage values for unused threads
    }

    __syncthreads();

    // Parallel reduction to sum squares
    for (int stride = 1; stride < numElements; stride *= 2) {
        int index = 2 * stride * i;

        if (index < numElements) {
            square[index] += square[index + stride];
        }

        __syncthreads();
    }

    // Thread 0 calculates and writes the final result
    if (i == 0) {
        *answer = sqrt(square[0]);
    }
}