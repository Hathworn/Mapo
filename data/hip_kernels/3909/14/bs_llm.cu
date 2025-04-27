#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void bs(float *drand, float *dput, float *dcall, int n) {
    int id = blockIdx.x * blockDim.x + threadIdx.x;

    if (id < n) {
        float c1 = 0.319381530f;
        float c2 = -0.356563782f;
        float c3 = 1.781477937f;
        float c4 = -1.821255978f;
        float c5 = 1.330274429f;

        float zero = 0.0f;
        float one = 1.0f;
        float two = 2.0f;
        float temp4 = 0.2316419f;

        float oneBySqrt2pi = 0.398942280f;

        float d1, d2;
        float phiD1, phiD2;
        float sigmaSqrtT;
        float KexpMinusRT;

        float inRand = drand[id];

        float S = S_LOWER_LIMIT * inRand + S_UPPER_LIMIT * (1.0f - inRand);
        float K = K_LOWER_LIMIT * inRand + K_UPPER_LIMIT * (1.0f - inRand);
        float T = T_LOWER_LIMIT * inRand + T_UPPER_LIMIT * (1.0f - inRand);
        float R = R_LOWER_LIMIT * inRand + R_UPPER_LIMIT * (1.0f - inRand);
        float sigmaVal = SIGMA_LOWER_LIMIT * inRand + SIGMA_UPPER_LIMIT * (1.0f - inRand);

        sigmaSqrtT = sigmaVal * sqrtf(T); // Use sqrtf for single precision

        d1 = (logf(S / K) + (R + sigmaVal * sigmaVal / two) * T) / sigmaSqrtT; // Use logf for single precision
        d2 = d1 - sigmaSqrtT;

        KexpMinusRT = K * expf(-R * T); // Use expf for single precision

        // Define a lambda to calculate the standard normal CDF
        auto phi = [&] (float X) -> float {
            float absX = fabsf(X); // Use fabsf for single precision
            float t = one / (one + temp4 * absX);
            float y = one - oneBySqrt2pi * expf(-X * X / two) * t * (c1 + t * (c2 + t * (c3 + t * (c4 + t * c5))));
            return (X < zero) ? (one - y) : y; // Ternary operator for conditional assignment
        };

        phiD1 = phi(d1);
        phiD2 = phi(d2);

        dcall[id] = S * phiD1 - KexpMinusRT * phiD2;

        phiD1 = phi(-d1); // Reuse the lambda for -d1
        phiD2 = phi(-d2); // Reuse the lambda for -d2

        dput[id] = KexpMinusRT * phiD2 - S * phiD1;
    }
}