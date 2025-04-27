#include "hip/hip_runtime.h"
#include "includes.h"
const int Nthreads = 1024, maxFR = 5000, NrankMax = 6;

__global__ void extract_snips(const double *Params, const int *st, const int *id, const int *counter, const float *dataraw, float *WU) {

    int nt0, tidx, bid, ind, NT, Nchan, Nmax;
    NT = (int) Params[0];
    nt0 = (int) Params[4];
    Nchan = (int) Params[9];

    tidx = threadIdx.x;
    bid = blockIdx.x;

    Nmax = min(maxFR, counter[1]);

    // Use shared memory for better memory access patterns
    extern __shared__ float shared_data[];
    
    for (ind = 0; ind < Nmax; ind++) {
        if (id[ind] == bid) {
            int offset = nt0 * Nchan * ind;
            for (int ch = threadIdx.y; ch < Nchan; ch += blockDim.y) {
                // Load data into shared memory for coalesced access
                shared_data[tidx + ch * blockDim.x] = dataraw[st[ind] + tidx + NT * ch];
                
                // Synchronize threads to ensure shared memory is fully populated
                __syncthreads();

                // Write from shared memory to global memory with coalesced writes
                WU[tidx + ch * nt0 + offset] = shared_data[tidx + ch * blockDim.x];
                
                // Synchronize threads before next operation
                __syncthreads();
            }
        }
    }
}