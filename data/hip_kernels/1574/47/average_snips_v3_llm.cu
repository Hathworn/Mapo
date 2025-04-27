#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void average_snips_v3(const double *Params, const int *ioff, const int *id, const float *uproj, const float *cmax, float *bigArray) {
    // Load constant parameters into registers 
    int Nspikes = (int) Params[0];
    int Nfeatures = (int) Params[1];
    int NfeatW = (int) Params[4];
    
    // Calculate thread and block index
    int tid = threadIdx.x; // feature index
    int bid = blockIdx.x;  // filter index

    // Use shared memory to cache data for better performance
    __shared__ float sharedUproj[Nfeatures];

    for (int ind = 0; ind < Nspikes; ind++) {
        // Load uproj portion into shared memory
        if (tid < Nfeatures) {
            sharedUproj[tid] = uproj[tid + Nfeatures * ind];
        }
        __syncthreads();

        if (id[ind] == bid) {
            // Access shared memory to reduce global memory reads
            float xsum = sharedUproj[tid];
            atomicAdd(&bigArray[ioff[ind] + tid + tid * NfeatW + Nfeatures * NfeatW * bid], xsum);
        }
        __syncthreads(); // Ensure all threads completed the operation before next iteration
    }
}