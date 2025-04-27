#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kernelB(float* r, float* x, float* y, float* z, int size)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global thread index
    int totalThreads = gridDim.x * blockDim.x; // Calculate total number of threads

    // Utilize stride pattern to allow threads to process more elements
    for (int i = idx; i < size; i += totalThreads) {
        r[i] = x[i] * y[i] + z[i];
    }
}