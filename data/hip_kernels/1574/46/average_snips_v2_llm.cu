#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void average_snips_v2(const double *Params, const int *iC, const int *call, const int *id, const float *uproj, const float *cmax, float *WU) {
    // Optimize: Use shared memory for frequently accessed params
    extern __shared__ int shared_iC[];
    int Nspikes = (int) Params[0];
    int NrankPC = (int) Params[1];
    int Nchan = (int) Params[7];
    int NchanNear = (int) Params[6];
    
    int bid = blockIdx.x;
    float xsum = 0.0f;

    // Cache iC in shared memory
    if (threadIdx.x < NchanNear * Nchan) {
        shared_iC[threadIdx.x] = iC[threadIdx.x];
    }
    __syncthreads();
    
    // Process spikes for this block
    for (int ind = threadIdx.x; ind < Nspikes; ind += blockDim.x) {
        if (id[ind] == bid) {
            int my_chan = call[ind];
            for (int chanIndex = 0; chanIndex < NchanNear; ++chanIndex) {
                int this_chan = shared_iC[chanIndex + NchanNear * my_chan];
                for (int pcIndex = 0; pcIndex < NrankPC; ++pcIndex) {
                    xsum = uproj[pcIndex + NrankPC * chanIndex + NrankPC * NchanNear * ind];
                    atomicAdd(&WU[pcIndex + NrankPC * this_chan + NrankPC * Nchan * bid], xsum); // Optimize: Use atomicAdd to avoid collisions
                }
            }
        }
    }
}