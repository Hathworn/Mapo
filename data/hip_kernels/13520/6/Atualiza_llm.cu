```c
#include "hip/hip_runtime.h"
#include "includes.h"

// Utilize shared memory for improved memory access efficiency
__global__ void Atualiza(double *u, double *u_prev, const int n) {
    extern __shared__ double shared_u_prev[];
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int tx = threadIdx.x;

    // Load data to shared memory
    if (idx < n) {
        shared_u_prev[tx] = u_prev[idx];
        if (tx == 0 && idx > 0) {
            shared_u_prev[tx - 1] = u_prev[idx - 1];
        }
        if (tx == blockDim.x - 1 && idx < n - 1) {
            shared_u_prev[tx + 1] = u_prev[idx + 1];
        }
    }
    __syncthreads();

    // Update u array with boundary condition check
    if (idx < n) {
        if (idx == 0) {
            u[0] = u[n] = 0.;  // Boundary condition
        } else {
            u[idx] = shared_u_prev[tx] + kappa * dt / (dx * dx) * 
                     (shared_u_prev[tx - 1] - 2 * shared_u_prev[tx] + shared_u_prev[tx + 1]);
        }
    }
}