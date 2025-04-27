#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void average_snips(const double *Params, const int *iC, const int *call, const int *id, const float *uproj, const float *cmax, float *WU) {
    // Cache parameters in local variables for constant memory access
    int Nspikes = (int)Params[0];
    int NrankPC = (int)Params[1];
    int Nchan = (int)Params[7];
    int NchanNear = (int)Params[6];

    // Use local variables for thread and block indices
    int tidx = threadIdx.x;
    int tidy = threadIdx.y;
    int bid = blockIdx.x;

    float xsum;

    // Use shared memory to reduce global memory accesses
    __shared__ float shared_uproj[1024]; // Adjust size as needed

    for (int ind = tidx; ind < Nspikes; ind += blockDim.x) {
        if (id[ind] == bid) {
            int my_chan = call[ind];
            int this_chan = iC[tidy + NchanNear * my_chan];

            // Preload data into shared memory for coalesced access
            shared_uproj[tidx] = uproj[tidx + NrankPC * tidy + NrankPC * NchanNear * ind];
            __syncthreads(); // Ensure all threads have loaded the data

            xsum = shared_uproj[tidx];
            atomicAdd(&WU[tidx + NrankPC * this_chan + NrankPC * Nchan * bid], xsum); // Use atomicAdd to prevent collisions
        }
    }
}