#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void _segmentedScanBackKer(float *maxdist, int *maxdistidx, int *label, float *blockmaxdist, int *blocklabel, int *blockmaxdistidx, int numelements) {
    // Declare shared memory for storing the last element of the previous block
    __shared__ float shdcurmaxdist;
    __shared__ int shdcurlabel;
    __shared__ int shdcurmaxdistindex;
    __shared__ int state;

    // Calculate the index for block-level accumulation
    int idx = (blockIdx.x + 1) * blockDim.x + threadIdx.x;

    // First thread of each block reads the previous block's last element
    if (threadIdx.x == 0) {
        shdcurmaxdist = blockmaxdist[blockIdx.x];
        shdcurlabel = blocklabel[blockIdx.x];
        shdcurmaxdistindex = blockmaxdistidx[blockIdx.x];
        state = (label[idx] == shdcurlabel);
    }

    // Synchronize within the block
    __syncthreads();

    // Exit if the previous block is unrelated, or index is beyond array length
    if (state == 0 || idx >= numelements)
        return;

    // Update max distance and index if the segment label matches
    if (label[idx] == shdcurlabel && maxdist[idx] < shdcurmaxdist) {
        maxdist[idx] = shdcurmaxdist;
        maxdistidx[idx] = shdcurmaxdistindex;
    }
}