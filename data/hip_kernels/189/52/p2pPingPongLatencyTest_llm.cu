#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void p2pPingPongLatencyTest(void *_pLocal, void *_pRemote, uint64_t *pTimestamps, int bWait, int cIterations)
{
    // Use volatile pointers for shared data access
    volatile int *pLocal = (volatile int *)_pLocal;
    volatile int *pRemote = (volatile int *)_pRemote;
    int pingpongValue = 0;

    // Kernel thread index
    int idx = threadIdx.x + blockDim.x * blockIdx.x;
    
    // Ensure only one thread performs the operations to prevent race conditions
    if (idx == 0) {
        while (cIterations--) {
            *pTimestamps++ = clock64(); // Record the clock at each iteration
            if (bWait) {
                // Spin-wait for the local value to match ping-pong value
                while (*pLocal != pingpongValue);
            }
            bWait = 1; // Ensure waiting in subsequent iterations
            pingpongValue = 1 - pingpongValue; // Toggle ping-pong value
            *pRemote = pingpongValue; // Update the remote value
        }
    }
}