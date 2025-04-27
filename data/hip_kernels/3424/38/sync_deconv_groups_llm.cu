#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sync_deconv_groups() {
    // Group synchronization at global level
    __sync();
}