#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void lumHistExclusiveScan_kernel(unsigned int *d_out, unsigned int *d_in, int numItems)
{
    extern __shared__ unsigned int s_exScan[];
    int tid = threadIdx.x;

    // Load input into shared memory, use a single conditional statement
    s_exScan[tid] = (tid > 0) ? d_in[tid - 1] : 0;
    __syncthreads();

    // Use a reduced number of synchronizations by restructuring the loop
    for (int offset = 1; offset < numItems; offset *= 2) {
        unsigned int temp = s_exScan[tid];
        if ((tid - offset) >= 0) {
            s_exScan[tid] = temp + s_exScan[tid - offset];
        }
        __syncthreads();
    }
    // Write the result back to global memory
    d_out[tid] = s_exScan[tid];
}