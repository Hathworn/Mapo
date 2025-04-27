#include "hip/hip_runtime.h"
#include "includes.h"

// WARNING : device_sum size should be gridDim.x
__global__ void vec_erfcinv(int n, double *result, double *y) {
    // Calculate unique thread index
    int id = threadIdx.x + blockIdx.x * blockDim.x + (threadIdx.y + blockIdx.y * blockDim.y) * gridDim.x * blockDim.x;

    // Ensure thread operates within bounds
    if (id < n) {
        // Perform inverse complementary error function calculation
        result[id] = erfcinv(y[id]);
    }
}