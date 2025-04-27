#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kernel_mult_vector_by_number(double *vec, double alpha, int numElements)
{
    int gid = blockIdx.x * blockDim.x + threadIdx.x;

    // Optimize by using grid-stride loops to handle large data efficiently
    for (int i = gid; i < numElements; i += blockDim.x * gridDim.x) {
        vec[i] *= alpha;
    }
}