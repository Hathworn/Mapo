```c
#include "hip/hip_runtime.h"
#include "includes.h"

#define N 16384
#define PI 3.14

__global__ void FFT(float * R, float * I, float * xR, float * xI)
{
    // Calculate global thread index
    int id = threadIdx.x + blockIdx.x * blockDim.x;
    
    // Initialize real and imaginary accumulators
    float real_even = 0.0f, imag_even = 0.0f; 
    float real_odd = 0.0f, imag_odd = 0.0f;
    
    // Precompute common expressions
    const float angleStep = (2 * PI) / N;
    const int halfN = N / 2;

    for (int i = 0; i < halfN; i++)
    {
        // Calculate angles
        float angle_even = angleStep * i * 2;
        float angle_odd = angleStep * (i * 2 + 1);

        // Precompute trigonometric values
        float cos_even = cos(angle_even), sin_even = sin(angle_even);
        float cos_odd = cos(angle_odd), sin_odd = sin(angle_odd);
        
        // Calculate contributions for even indices
        real_even += R[i] * cos_even - I[i] * sin_even;
        imag_even += R[i] * -sin_even + I[i] * cos_even;

        // Calculate contributions for odd indices
        real_odd += R[i] * cos_odd - I[i] * sin_odd;
        imag_odd += R[i] * -sin_odd + I[i] * cos_odd;
    }

    // Combine even and odd contributions
    xR[id] = real_even + real_odd;
    xI[id] = imag_even + imag_odd;
}