#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void updateStatistic ( const int nwl, const float *stt1, const float *q, const float *r, float *stt0 ) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if ( i < nwl ) {
        // Use ternary operator for concise conditional assignment
        stt0[i] = (q[i] > r[i]) ? stt1[i] : stt0[i];
    }
}