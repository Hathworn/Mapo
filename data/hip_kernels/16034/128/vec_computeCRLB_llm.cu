#include "hip/hip_runtime.h"
#include "includes.h"

// Global function optimization
__global__ void vec_computeCRLB(int n, int sizeMatrix, double *output, double *input, double h) {
    int sizeSubImage = n / (sizeMatrix * sizeMatrix);
    int id = blockIdx.x * blockDim.x + threadIdx.x; // Simplify index calculation for 1D grid

    if (id < n) {
        int p = id / sizeSubImage;
        int positpix = id % sizeSubImage;
        int line = p / sizeMatrix;
        int column = p % sizeMatrix;

        // Use shared memory to reduce global memory access latency
        extern __shared__ double shared_input[];
        shared_input[threadIdx.x] = input[positpix];
        __syncthreads();

        if (shared_input[threadIdx.x] > 0) {
            double d1 = (input[positpix + sizeSubImage * (line * 2 + 2)] - input[positpix + sizeSubImage * (line * 2 + 1)]) / (2 * h);
            double d2 = (input[positpix + sizeSubImage * (column * 2 + 2)] - input[positpix + sizeSubImage * (column * 2 + 1)]) / (2 * h);
            output[id] = (d1 * d2) / shared_input[threadIdx.x];
        } else {
            output[id] = 1e8; // Use scientific notation for readability
        }
    }
}