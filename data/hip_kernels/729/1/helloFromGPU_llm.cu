#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void helloFromGPU(){
    // Use a variable to avoid multiple calls to threadIdx.x
    int idx = threadIdx.x;
    if(idx == 5){
        printf("Hello World from GPU! thread %d\n", idx);
    }
}