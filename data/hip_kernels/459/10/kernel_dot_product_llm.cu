#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_dot_product(const double *vec1, const double *vec2, int numElements, double *answer)
{
    extern __shared__ double products[];

    int i = threadIdx.x;

    // Load product into shared memory
    products[i] = vec1[i] * vec2[i];
    __syncthreads();

    // Reduce using a parallel reduction
    for (int stride = 1; stride < numElements; stride *= 2) {
        if (i % (2 * stride) == 0 && i + stride < numElements) {
            products[i] += products[i + stride];
        }
        __syncthreads();
    }

    // Store the result
    if (i == 0) {
        *answer = products[0];
    }
}