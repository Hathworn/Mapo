#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Reconstruct(int *nex, unsigned long nextsize, double4 *pc, double4 *vc, double4 *a3, double4 *a, double4 *a1, double4 *a2, double4 *pva3, double4 *aaa) {

    unsigned int gtid = blockIdx.x * blockDim.x + threadIdx.x;

    // Precompute index to reduce repeated computation
    if (gtid < 6 * nextsize) {
        int k = gtid / nextsize;
        int who = nex[gtid % nextsize];  // Use modular arithmetic for cleaner index calculation
        if (k == 0) {
            pc[who] = pva3[gtid];
        } else if (k == 1) {
            vc[who] = pva3[gtid];
        } else if (k == 2) {
            a3[who] = pva3[gtid];
        } else if (k == 3) {
            a[who] = aaa[gtid - 3 * nextsize];
        } else if (k == 4) {
            a1[who] = aaa[gtid - 3 * nextsize];
        } else if (k == 5) {
            a2[who] = aaa[gtid - 3 * nextsize];
        }
    }
}