#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void chooseLaw ( const int nwl, const int *kex, const float *didi11, const float *didi12, const float *didi13, float *didi1 ) {
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global index
    if ( i < nwl ) {
        int choice = kex[i]; // Cache kex value
        if(choice == 0) {
            didi1[i] = didi11[i]; // Select didi1 based on the kex value
        } else if(choice == 1) {
            didi1[i] = didi12[i];
        } else if(choice == 2) {
            didi1[i] = didi13[i];
        }
    } 
}