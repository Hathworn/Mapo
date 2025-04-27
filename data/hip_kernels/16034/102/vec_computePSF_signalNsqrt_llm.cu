#include "hip/hip_runtime.h"
#include "includes.h"

// WARNING: device_sum size should be gridDim.x
__global__ void vec_computePSF_signalNsqrt(int n, double *result, double *fft, double divide, int *sparseIndexEvenShift2D, int *sparseIndexOddShift2D) {
    // Calculate global thread ID
    int id = blockIdx.x * blockDim.x + threadIdx.x + (blockIdx.y * blockDim.x * gridDim.x) + (threadIdx.y * blockDim.x);

    // Ensure ID is within range
    if (id < n) {
        // Retrieve and normalize the values
        double x = fft[sparseIndexEvenShift2D[id]] / divide;
        double y = fft[sparseIndexOddShift2D[id]] / divide;
        
        // Calculate result (magnitude)
        result[id] = sqrt(x * x + y * y);
    }
}