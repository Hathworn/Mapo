#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Reconstruct(int *nex, unsigned long nextsize, double4 *pc, double4 *vc, double4 *a3, double4 *a, double4 *a1, double4 *a2, double4 *pva3, double4 *aaa) {
    unsigned int gtid = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Pre-calculate commonly used values
    int k = gtid / nextsize;
    int offset_gtid = gtid % nextsize;  // Offset within a particular nextsize segment
    int who = nex[offset_gtid];

    // Use a switch-case to minimize branching and improve readability
    switch (gtid / nextsize) {
        case 0:
            pc[who] = pva3[gtid];
            break;
        case 1:
            vc[who] = pva3[gtid];
            break;
        case 2:
            a3[who] = pva3[gtid];
            break;
        case 3:
            a[who] = aaa[offset_gtid];
            break;
        case 4:
            a1[who] = aaa[offset_gtid];
            break;
        case 5:
            a2[who] = aaa[offset_gtid];
            break;
    }
}