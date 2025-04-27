#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void tridiag_x_matrix_k(float* p_d, float* p_m, float* p_u, float* u, int n)
{
    // Identifies the thread working within a group
    int tidx = threadIdx.x % n;
    // Identifies the data concerned by the computations
    int Qt = (threadIdx.x - tidx) / n;

    extern __shared__ float sAds[];
    float* su = &sAds[4 * Qt * n];
    float* sp_d = &su[n];
    float* sp_m = &sp_d[n];
    float* sp_u = &sp_m[n];

    int globalIdx = blockIdx.x * blockDim.x + threadIdx.x;

    // Load inputs into shared memory
    su[threadIdx.x] = u[globalIdx];
    sp_d[tidx] = p_d[tidx];
    sp_m[tidx] = p_m[tidx];
    sp_u[tidx] = p_u[tidx];
    __syncthreads();

    float temp;
    // Combine conditions to avoid redundant checks
    if (tidx == 0) {
        temp = sp_m[tidx] * su[tidx] + sp_u[tidx] * su[tidx + 1];
    } else if (tidx == n - 1) {
        temp = sp_d[tidx] * su[tidx - 1] + sp_m[tidx] * su[tidx];
    } else {
        temp = sp_d[tidx] * su[tidx - 1] + sp_m[tidx] * su[tidx] + sp_u[tidx] * su[tidx + 1];
    }

    // Store the result back to global memory
    u[globalIdx] = temp;
}