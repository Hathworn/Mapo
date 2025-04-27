#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void MyFloatScale(float *a, float scale, int size) {
    // Efficient thread index calculation
    const int threadID = blockIdx.x * blockDim.x + threadIdx.x;
    const int stride = blockDim.x * gridDim.x;

    // Optimize memory access by using striding loop
    for (int i = threadID; i < size; i += stride) {
        a[i] *= scale;
    }
}