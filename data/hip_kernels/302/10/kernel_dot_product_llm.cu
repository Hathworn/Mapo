#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_dot_product(const double * vec1, const double * vec2, int numElements, double * answer)
{
    extern __shared__ double products[]; // Shared memory for partial products

    int i = threadIdx.x;

    // Load and compute product for current element
    if (i < numElements) {
        products[i] = vec1[i] * vec2[i];
    } else {
        products[i] = 0.0; // Handle threads exceeding the number of elements
    }

    __syncthreads();

    // Reduce sum across all threads using sequential addressing
    for (int stride = 1; stride < blockDim.x; stride *= 2) {
        if (i % (2 * stride) == 0 && (i + stride) < numElements) {
            products[i] += products[i + stride];
        }
        __syncthreads();
    }

    // Write final result to answer
    if (i == 0) {
        *answer = products[0];
    }
}