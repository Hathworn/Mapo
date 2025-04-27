#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void addForces_k(float2 *v, int dx, int dy, int spx, int spy, float fx, float fy, int r, size_t pitch) {
    // Calculate the unique thread index for memory access
    int tx = threadIdx.x;
    int ty = threadIdx.y;
    
    // Pointer to the specific element in the 2D v array
    float2 *fj = (float2*)((char*)v + (ty + spy) * pitch) + tx + spx;

    // Load the value at the fj position into the register
    float2 vterm = *fj;

    // Adjust 'tx' and 'ty' with radius 'r'
    int adjusted_tx = tx - r;
    int adjusted_ty = ty - r;
    
    // Pre-compute powers to improve performance
    float tx4 = adjusted_tx * adjusted_tx * adjusted_tx * adjusted_tx;
    float ty4 = adjusted_ty * adjusted_ty * adjusted_ty * adjusted_ty;
    
    // Compute scaling factor 's'
    float s = 1.f / (1.f + tx4 + ty4);
    
    // Update the x and y components of vterm
    vterm.x += s * fx;
    vterm.y += s * fy;

    // Write the updated value back to global memory
    *fj = vterm;
}
```
