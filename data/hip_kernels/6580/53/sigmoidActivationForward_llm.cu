#include "hip/hip_runtime.h"
#include "includes.h"

__device__ float sigmoid(float x) {
    return 1.0f / (1 + __expf(-x));
}

__global__ void sigmoidActivationForward(float* Z, float* A, int Z_x_dim, int Z_y_dim) {

    // Calculate the global index and ensure all threads are utilized
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;

    // Loop through the elements in steps of total threads
    for (int i = index; i < Z_x_dim * Z_y_dim; i += stride) {
        A[i] = sigmoid(Z[i]);
    }
}