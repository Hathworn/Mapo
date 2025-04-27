#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void inter_kernel(int NX, float *X, int NY, float *Y, int B, float *OUT)
{
    // Calculate global thread index
    int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Compute total number of elements per batch
    int total_elements_per_batch = NX + NY;

    // Loop over batches
    for (int i = index; i < (NX + NY) * B; i += blockDim.x * gridDim.x) {
        int b = i / total_elements_per_batch; // Determine batch index
        int j = i % total_elements_per_batch; // Determine element index within the batch

        // Select element from X or Y based on index
        if (j < NX) {
            OUT[i] = X[b * NX + j];
        } else {
            OUT[i] = Y[b * NY + j - NX];
        }
    }
}