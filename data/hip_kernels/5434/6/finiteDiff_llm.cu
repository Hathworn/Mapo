#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void finiteDiff(const int c, const double dt, const double dx, const int nt, const int nx, double *u, double *un) {

    int index = blockIdx.x * blockDim.x + threadIdx.x;

    for (int t = 0; t < nt; t++) {
        if (index < nx) {  // Check to prevent out-of-bounds access
            // Use shared memory to minimize global memory access
            extern __shared__ double shared_un[];
            shared_un[index] = u[index];
            __syncthreads();

            if (index > 0) {
                u[index] = shared_un[index] - c * dt / dx * (shared_un[index] - shared_un[index - 1]);
            }
            __syncthreads();
        }
    }
}