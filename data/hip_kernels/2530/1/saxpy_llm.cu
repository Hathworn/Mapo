#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void saxpy(float *x, float *y, const float a)
{
    // Calculate unique index for the thread
    const int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use shared memory for better memory access patterns if applicable
    if (i < ARRAY_SIZE) {
        // Efficient memory access by utilizing registers
        float xi = x[i];
        float yi = y[i];
        yi = a * xi + yi;
        y[i] = yi;
    }
}