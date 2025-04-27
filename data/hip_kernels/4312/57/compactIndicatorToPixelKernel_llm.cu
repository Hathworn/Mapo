#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel
__global__ void compactIndicatorToPixelKernel(const unsigned* candidate_pixel_indicator, const unsigned* prefixsum_indicator, unsigned img_cols, ushort2* compacted_pixels) {
    const auto idx = threadIdx.x + blockIdx.x * blockDim.x;
    
    // Avoid unnecessary memory access by checking if the index is in bounds
    if (idx < img_cols * gridDim.x * blockDim.x && candidate_pixel_indicator[idx] > 0) {
        const auto offset = prefixsum_indicator[idx] - 1;
        const unsigned short x = idx % img_cols;
        const unsigned short y = idx / img_cols;
        compacted_pixels[offset] = make_ushort2(x, y);
    }
}