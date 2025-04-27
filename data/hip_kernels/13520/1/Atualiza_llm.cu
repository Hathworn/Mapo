```c
#include "hip/hip_runtime.h"
#include "includes.h"

#define tam 1.0
#define dx 0.00001
#define dt 0.000001
#define T 0.01
#define kappa 0.000045

__global__ void Atualiza(double *u, double *u_prev, const int n) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Use shared memory to improve memory access efficiency
    extern __shared__ double shared_u_prev[];
    
    // Load data into shared memory
    if (idx <= n) {
        shared_u_prev[threadIdx.x] = u_prev[idx];
    }
    __syncthreads();

    if (idx == 0) {
        u[0] = u[n] = 0.; // enforce boundary condition
    }
    else if (idx < n) {
        // Calculate using shared memory
        u[idx] = shared_u_prev[threadIdx.x] + kappa * dt / (dx * dx) *
                 (shared_u_prev[threadIdx.x - 1] - 2 * shared_u_prev[threadIdx.x] + shared_u_prev[threadIdx.x + 1]);
    }
}