#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void calculateDelaysAndPhases(double * gpuDelays, double lo, double sampletime, int fftsamples, int fftchannels, int samplegranularity, float * rotationPhaseInfo, int *sampleShifts, float* fractionalSampleDelays)
{
    size_t ifft = threadIdx.x + blockIdx.x * blockDim.x;
    size_t iant = blockIdx.y;
    int numffts = blockDim.x * gridDim.x;
    double meandelay, deltadelay, netdelaysamples_f, startphase;
    double d0, d2, a, b;
    double *interpolator = &(gpuDelays[iant * 4]);
    double filestartoffset = gpuDelays[iant * 4 + 3];
    float fractionaldelay;
    int netdelaysamples;

    // Calculate initial and ending delays for interpolation
    d0 = interpolator[0] * ifft * ifft + interpolator[1] * ifft + interpolator[2];
    d2 = interpolator[0] * (ifft + 1.0) * (ifft + 1.0) + interpolator[1] * (ifft + 1.0) + interpolator[2];

    // Calculate gradient and mean delay
    a = d2 - d0; // delay gradient
    b = d0; // start delay
    meandelay = a * 0.5 + b; // mean delay in the FFT window
    deltadelay = a / fftsamples; // delay change per sample

    netdelaysamples_f = (meandelay - filestartoffset) / sampletime;
    netdelaysamples = __double2int_rn(netdelaysamples_f / samplegranularity) * samplegranularity;

    // Store integer sample shifts
    sampleShifts[iant * numffts + ifft] = netdelaysamples;

    // Store fractional delay
    fractionaldelay = static_cast<float>(-(netdelaysamples_f - netdelaysamples) * 2 * M_PI / fftsamples);
    fractionalSampleDelays[iant * numffts + ifft] = fractionaldelay;

    // Calculate and store fringe rotation phases
    startphase = b * lo;
    rotationPhaseInfo[iant * numffts * 2 + ifft * 2] = static_cast<float>((startphase - int(startphase)) * 2 * M_PI);
    rotationPhaseInfo[iant * numffts * 2 + ifft * 2 + 1] = static_cast<float>(deltadelay * lo * 2 * M_PI);
}