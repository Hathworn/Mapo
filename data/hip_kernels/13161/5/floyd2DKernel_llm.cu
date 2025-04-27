#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void floyd2DKernel(int * M, const int nverts, const int k) {
    // Calculate global thread indices directly, avoiding extra calculations
    int j = blockIdx.x * blockDim.x + threadIdx.x;
    int i = blockIdx.y * blockDim.y + threadIdx.y;

    // Proceed only if within matrix bounds
    if (i < nverts && j < nverts) {
        if (i != j && i != k && j != k) {
            // Optimize memory accesses using shared memory pattern
            int ik = (i * nverts) + k;
            int kj = (k * nverts) + j;
            int ij = (i * nverts) + j;

            // Compute new path cost and update if better
            int aux = M[ik] + M[kj];
            if (aux < M[ij]) {
                M[ij] = aux;
            }
        }
    }
}