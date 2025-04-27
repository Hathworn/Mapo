```c
#include "hip/hip_runtime.h"
#include "includes.h"

// Constants are pre-calculated for efficient computation
__global__ void mul_ctf(float *image, int nx, int ny, float defocus, float cs, float voltage, float apix, float bfactor, float ampcont) {

    // Block index
    int bx = blockIdx.x;

    // Thread index
    int tx = threadIdx.x;

    // Compute coordinates
    float x = float(bx);
    float y = (tx >= ny >> 1) ? float(tx - ny) : float(tx);
    int index = bx * 2 + tx * (nx + 2);

    // Pre-calculate constants for CTF computation
    float lambda = 12.398f / sqrt(voltage * (1022.f + voltage));
    float cst = cs * 1.0e7f;
    float wgh = ampcont / 100.0f;
    float phase = atan(wgh / sqrt(1.0f - wgh * wgh));
    float ak = sqrt(x * x + y * y) / (nx * apix);
    float ak2 = ak * ak;

    // Compute CTF
    float g1 = defocus * 1.0e4f * lambda * ak2;
    float g2 = cst * lambda * lambda * lambda * ak2 * ak2 * 0.5f;
    float ctfv = sin(PI * (g1 - g2) + phase);
    
    if (bfactor != 0.0f) {
        ctfv *= exp(-bfactor * ak2 * 0.25f);
    }

    // Apply CTF to the complex image
    image[index] *= ctfv;
    image[index + 1] *= ctfv;
}