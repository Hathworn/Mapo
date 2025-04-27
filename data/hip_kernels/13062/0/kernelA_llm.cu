#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kernelA(float* r, float* x, float* y, float* z, int size)
{
    // Utilize global indexing for better performance.
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;
    
    // Loop to cover larger array sizes through strided access.
    for (int i = idx; i < size; i += stride) {
        r[i] = x[i] * y[i] + z[i];
    }
}