#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vectFill(int *data1, int *data2, int *restult, unsigned long sizeOfArray) {
    unsigned long idx = blockDim.x * blockIdx.x + threadIdx.x;
    unsigned long stride = blockDim.x * gridDim.x;

    // Use stride loop to optimize memory access and improve parallelism
    for (unsigned long i = idx; i < sizeOfArray; i += stride) {
        restult[i] = data1[i] + data2[i];
    }
}