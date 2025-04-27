#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void supp_kernel(int N, float ALPHA, float *X, int INCX)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global thread index
    int gridSize = blockDim.x * gridDim.x; // Calculate grid stride

    // Loop through the array with a grid stride loop
    while (i < N) {
        float value = X[i * INCX]; // Cache the value to reduce repetitive memory access
        if ((value * value) < (ALPHA * ALPHA)) {
            X[i * INCX] = 0; // Set the element to zero if the condition is met
        }
        i += gridSize; // Move to the next element in grid stride
    }
}