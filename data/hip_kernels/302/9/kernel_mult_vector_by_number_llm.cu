#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_mult_vector_by_number(double *vec, double alpha, int numElements)
{
    int gid = blockIdx.x * blockDim.x + threadIdx.x;

    // Combine condition check with loop
    for (int index = gid; index < numElements; index += blockDim.x * gridDim.x) {
        vec[index] *= alpha;
    }
}