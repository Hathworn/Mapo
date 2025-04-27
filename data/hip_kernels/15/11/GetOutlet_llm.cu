```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void GetOutlet(double *h, double *houtlet, double *u, double *uout, double *v, double *vout, int M, int N, int t) {
    int tid = threadIdx.x + blockIdx.x * blockDim.x;

    // Cache the common (tid + 1) * N - ind index calculation
    int ind = 2;
    int offset = N - ind;

    while (tid < M) {
        int idx = (tid + 1) * offset;
        houtlet[t * M + tid] = h[idx];
        vout[t * M + tid] = v[idx];
        uout[t * M + tid] = u[idx];
        tid += blockDim.x * gridDim.x;
    }
}