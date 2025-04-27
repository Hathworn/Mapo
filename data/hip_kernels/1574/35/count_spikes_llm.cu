#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void count_spikes(const double *Params, const int *id, int *nsp) {
    int Nspikes = (int) Params[0];
    int Nfilters = (int) Params[2];
    int tid = threadIdx.x;
    int bid = blockIdx.x;
    int Nthreads = blockDim.x;
    int Nblocks = gridDim.x;
    
    __shared__ int local_nsp[1024];  // Use shared memory for partial sums
    local_nsp[tid] = 0;
    __syncthreads();

    int tind = tid + Nthreads * bid;
    while (tind < Nfilters) {
        for (int ind = 0; ind < Nspikes; ind++) {
            if (id[ind] == tind) {
                atomicAdd(&local_nsp[tid], 1);  // Accumulate using atomic add
            }
        }
        tind += Nthreads * Nblocks;
    }

    __syncthreads();

    // Reduce shared memory results to global memory
    if (tid == 0) {
        int sum = 0;
        for (int i = 0; i < Nthreads; i++) {
            sum += local_nsp[i];
        }
        atomicAdd(&nsp[bid], sum);
    }
}