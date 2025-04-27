```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void _bcnn_vsub_kernel(int n, float *a, float *b, float *y) {
    // Calculate the global index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    // Use stride to allow for flexible grid sizes
    int stride = blockDim.x * gridDim.x;
    // Perform vector subtraction with stride
    for (int index = i; index < n; index += stride) {
        y[index] = a[index] - b[index];
    }
}