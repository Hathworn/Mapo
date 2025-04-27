#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void count_spikes(const double *Params, const int *id, int *nsp, const float *x, float *V) {
    // Use shared memory to optimize memory access
    extern __shared__ int shared_nsp[];
    
    int tid = threadIdx.x;
    int bid = blockIdx.x;
    int NthreadsMe = blockDim.x;
    int Nblocks = gridDim.x;
    
    int Nspikes = (int) Params[0];
    int Nfilters = (int) Params[2];
    
    int tind = tid + NthreadsMe * bid;
    
    // Initialize shared memory
    if (tid < Nfilters) {
        shared_nsp[tid] = 0;
    }
    __syncthreads();
    
    while (tind < Nfilters) {
        float sum_V = 0.0f;

        for (int ind = 0; ind < Nspikes; ind++) {
            if (id[ind] == tind) {
                atomicAdd(&shared_nsp[tid], 1);  // Use atomic operations for thread safety
                sum_V += x[tind];
            }
        }
        
        // Accumulate result in global memory
        atomicAdd(&nsp[tind], shared_nsp[tid]);
        V[tind] += sum_V;
        
        // Normalize the voltage V
        V[tind] = V[tind] / (.001f + (float) nsp[tind]);

        tind += NthreadsMe * Nblocks;
    }
}