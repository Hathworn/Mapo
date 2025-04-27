#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void test()
{
    // Use local variable to reduce shared memory contention
    unsigned int localCounter = atomicInc(d_PointCounter, 0x7fffffff);
    
    // Perform computation with localCounter
    printf("cnt : %d \n", localCounter);
}