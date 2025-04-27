#include "hip/hip_runtime.h"
#include "includes.h"

// ERROR system
#define EXIT_OK (0)
#define ERROR_HOST_MEM (1)
#define ERROR_DEVICE_MEM (2)
#define ERROR_DEVICE (3)
#define ERROR_INIT (4)
#define ERROR_EMPTY (5)
#define ERROR_SETDEVICE (6)
#define EXIT_DONE (255)

// kernel to calculate the exp

__global__ void kmeans_exp_kernel(float* DIST, float pw)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x; // Simplified register usage
    if (idx < gridDim.x * blockDim.x) { // Boundary check to avoid out-of-bounds access
        float arg = DIST[idx] * pw;
        if (arg < -70) arg = -70; // Avoid passing an overly large negative value to exp
        DIST[idx] = expf(arg); // Use expf for better performance with float
    }
}