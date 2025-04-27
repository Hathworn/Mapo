#include "hip/hip_runtime.h"
#include "includes.h"

// Launch an empty kernel to measure overhead with minimal resource usage
__global__ void profileSubphaseNone_kernel() {
    // This global kernel does nothing, but you can include comments for potential extensions or use cases
}