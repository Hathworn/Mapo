#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void GetOutlet(double *h, double *houtlet, double *u, double *uout, double *v, double *vout, int M, int N, int t) {
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x; // Calculate stride outside loop

    int offset = N - 2; // Precompute offset as it doesn't change inside loop
    while (tid < M) {
        int index = (tid + 1) * N - offset; // Compute index only once
        houtlet[t * M + tid] = h[index];
        vout[t * M + tid] = v[index];
        uout[t * M + tid] = u[index];
        tid += stride;
    }
}