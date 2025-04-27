#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void warmUpGPU()
{
    // The kernel is used for GPU warm-up and deliberately does nothing,
    // there is no need for optimization as the function is intentionally empty.
}