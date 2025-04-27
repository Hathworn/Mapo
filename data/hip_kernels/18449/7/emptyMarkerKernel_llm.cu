#include "hip/hip_runtime.h"
#include "includes.h"

// Launch a simple kernel that does nothing, intended as a marker
__global__ void emptyMarkerKernel() {
    // The kernel is intentionally left empty for performance tracking or synchronization
}