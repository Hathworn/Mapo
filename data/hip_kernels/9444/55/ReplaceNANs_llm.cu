#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ReplaceNANs(float* buffer, float value, int size) {
    int offset = CUDASTDOFFSET;
    if (offset < size) {
        float current = buffer[offset];
        // Check if the current value is finite and replace if necessary
        buffer[offset] = isfinite(current) ? current : value;
    }
}