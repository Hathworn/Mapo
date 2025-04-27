#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void vecProduct(int *d_x, int *d_y, int *d_z, int N) {
    // Calculate the global index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // The stride for grid-stride loop
    int stride = blockDim.x * gridDim.x;

    // Use grid-stride loop to enable processing of more elements and improve occupancy
    for (int i = idx; i < N; i += stride) {
        d_z[i] = d_x[i] * d_y[i];
    }
}