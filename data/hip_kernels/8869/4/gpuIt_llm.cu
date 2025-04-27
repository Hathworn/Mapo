```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void gpuIt(float *tNew,float *tOld,float *tOrig,int x,int y,int z,float k,float st) {
    int i = threadIdx.x + blockIdx.x * blockDim.x;
    // Boundary check to avoid accessing out-of-bounds memory
    if(i < x*y*z){
        int xi = i % x; // X index
        int yi = (i / x) % y; // Y index

        // Neighbors' indices with boundary conditions
        int left   = (xi > 0)    ? i - 1   : i; 
        int right  = (xi < x-1)  ? i + 1   : i;
        int top    = (yi > 0)    ? i - x   : i;
        int bottom = (yi < y-1)  ? i + x   : i;

        // Compute update for interior and boundary cells
        tNew[i] = tOld[i] + k * (tOld[left] + tOld[right] + tOld[top] + tOld[bottom] - 4 * tOld[i]);

        // Restore original temperature if not a heat source
        if(tOrig[i] != st){
            tNew[i] = tOrig[i];
        }
    }
}