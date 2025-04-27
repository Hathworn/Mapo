#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void OPT_3_HIST(int* lcm, int* hist, int* lcmsizes, int n) {
    int vertex = blockIdx.x;
    int vcomp = threadIdx.x;

    // Use shared memory for cval
    __shared__ int cval;

    if (vcomp == 0) cval = 0;
    __syncthreads();

    if (vertex < n) {
        for (int i = vcomp; i < n; i += blockDim.x) {
            bool equal = false;

            if (vertex == i) {
                atomicAdd(&cval, 1);
            }
            else if ((lcmsizes[vertex+1] - lcmsizes[vertex]) == (lcmsizes[i+1] - lcmsizes[i])) {
                equal = true;

                // Use loop unrolling for comparison
                for (int j = 0; j < lcmsizes[vertex+1] - lcmsizes[vertex]; j++) {
                    if (lcm[lcmsizes[vertex] + j] != lcm[lcmsizes[i] + j]) {
                        equal = false;
                        break;
                    }
                }

                if (equal) {
                    atomicAdd(&cval, 1);
                }
            }
        }
    }
    __syncthreads();

    // Use atomic operations carefully and minimize them
    if (vcomp == 0 && cval > 0) {
        atomicAdd(&hist[cval], 1);
        // printf("\nv%d: %d\n", vertex, cval); // Uncomment for debugging
    }
}