#include "hip/hip_runtime.h"
#include "includes.h"

__device__ float phi(float X, float coeff1, float coeff2, float coeff3, float coeff4, float coeff5, float oneBySqrt2pi) {
    // Improved computation of phi using common expressions
    float temp4 = 0.2316419f;
    float absX = abs(X);
    float t = 1.0f / (1.0f + temp4 * absX);
    float expVar = exp(-X * X / 2.0f);
    float y = 1.0f - oneBySqrt2pi * expVar * t * (coeff1 + t * (coeff2 + t * (coeff3 + t * (coeff4 + t * coeff5))));
    return (X < 0.0f) ? (1.0f - y) : y;
}

__global__ void bs(float *drand, float *dput, float *dcall, int n) {
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if (id < n) { 
        // Constants optimized using device function
        const float c1 = 0.319381530f;
        const float c2 = -0.356563782f;
        const float c3 = 1.781477937f;
        const float c4 = -1.821255978f;
        const float c5 = 1.330274429f;

        const float oneBySqrt2pi = 0.398942280f;
        const float zero = 0.0f, one = 1.0f, two = 2.0f;

        float d1, d2, phiD1, phiD2, sigmaSqrtT, KexpMinusRT;
        float inRand = drand[id];

        // Simplified randomization using one line for each
        float S = S_LOWER_LIMIT * inRand + S_UPPER_LIMIT * (1.0f - inRand);
        float K = K_LOWER_LIMIT * inRand + K_UPPER_LIMIT * (1.0f - inRand);
        float T = T_LOWER_LIMIT * inRand + T_UPPER_LIMIT * (1.0f - inRand);
        float R = R_LOWER_LIMIT * inRand + R_UPPER_LIMIT * (1.0f - inRand);
        float sigmaVal = SIGMA_LOWER_LIMIT * inRand + SIGMA_UPPER_LIMIT * (1.0f - inRand);

        sigmaSqrtT = sigmaVal * sqrt(T);
        d1 = (log(S / K) + (R + sigmaVal * sigmaVal / two) * T) / sigmaSqrtT;
        d2 = d1 - sigmaSqrtT;

        KexpMinusRT = K * exp(-R * T);

        // Utilizing device function to calculate phi
        phiD1 = phi(d1, c1, c2, c3, c4, c5, oneBySqrt2pi);
        phiD2 = phi(d2, c1, c2, c3, c4, c5, oneBySqrt2pi);

        dcall[id] = S * phiD1 - KexpMinusRT * phiD2;

        phiD1 = phi(-d1, c1, c2, c3, c4, c5, oneBySqrt2pi);
        phiD2 = phi(-d2, c1, c2, c3, c4, c5, oneBySqrt2pi);

        dput[id] = KexpMinusRT * phiD2 - S * phiD1;
    }
}