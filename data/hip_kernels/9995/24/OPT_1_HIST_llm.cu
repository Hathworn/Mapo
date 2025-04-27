#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void OPT_1_HIST(int* lcm, int* hist, int n) {

    int vertex = blockIdx.x;
    int vcomp = threadIdx.x;

    // Shared memory for storing result of each block
    __shared__ int cval[1];

    // Initialize shared memory
    if(vcomp == 0) {
        cval[0] = 0;
    }
    __syncthreads();

    // Iterate over possible comparisons
    if(vertex < n && vcomp < n) {
        for(int i = vcomp; i < n; i += blockDim.x) {

            bool equal = false;

            if(vertex == i) {
                atomicAdd(&cval[0], 1);
            } else {
                equal = true;

                #pragma unroll // Use loop unrolling for better performance
                for(int j = 0; j < n; j++) {
                    if(lcm[vertex * n + j] != lcm[i * n + j]) {
                        equal = false;
                        break;
                    }
                }

                if(equal) {
                    atomicAdd(&cval[0], 1);
                }
            }
        }
    }

    __syncthreads();
    if(vertex < n && vcomp == 0 && cval[0] > 0) {
        atomicAdd(&hist[cval[0]], 1);
    }
}