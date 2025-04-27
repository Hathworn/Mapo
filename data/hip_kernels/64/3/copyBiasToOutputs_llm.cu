#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void copyBiasToOutputs(float *ptrbias, float *ptroutput, const int size1, const int size2, const int nOutputPlane, const int linestride, const int imstride)
{
    // Calculate 3D index for each thread
    const int tidx = blockDim.x * blockIdx.x + threadIdx.x;
    const int tidy = blockIdx.y;
    const int tidz = blockIdx.z;

    // Ensure tidx is within range before proceeding
    if (tidx < nOutputPlane) {
        float val = ptrbias[tidx];
        ptroutput += tidz * imstride + tidy * linestride;

        // Optimize loop to unroll for better performance
        #pragma unroll
        for (int k = 0; k < size2; k++) {
            ptroutput[k * nOutputPlane + tidx] = val;
        }
    }
}