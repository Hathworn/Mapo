```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void p2pPingPongLatencyTest(void *_pLocal, void *_pRemote, uint64_t *pTimestamps, int bWait, int cIterations)
{
    volatile int *pLocal = (volatile int *)_pLocal;
    volatile int *pRemote = (volatile int *)_pRemote;
    int pingpongValue = 0;

    // Utilize shared memory for common variables
    __shared__ int sharedPingpongValue;
    if (threadIdx.x == 0) {
        sharedPingpongValue = pingpongValue;
    }
    __syncthreads();

    while (cIterations--) {
        *pTimestamps++ = clock64();

        if (bWait) {
            while (*pLocal != sharedPingpongValue) {
                // Use __threadfence() to prevent stale cache reads
                __threadfence();
            }
        }
        bWait = 1;

        // Update the shared variable which prevents redundant assignments to pingpongValue
        sharedPingpongValue = 1 - sharedPingpongValue;

        if (threadIdx.x == 0) {
            *pRemote = sharedPingpongValue;
        }
        __syncthreads();
    }
}