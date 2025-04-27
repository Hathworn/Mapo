#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void SoftClipKernel(const float* p_Input, float* p_Output, int p_Width, int p_Height, 
                               float p_SoftClipA, float p_SoftClipB, float p_SoftClipC, float p_SoftClipD, 
                               float p_SoftClipE, float p_SoftClipF, int p_SwitchA, int p_SwitchB, int p_Source) {
    const int x = blockIdx.x * blockDim.x + threadIdx.x;
    const int y = blockIdx.y * blockDim.y + threadIdx.y;
    if (x < p_Width && y < p_Height) {
        const int index = (y * p_Width + x) * 4;
        float r = p_Input[index];
        float g = p_Input[index + 1];
        float b = p_Input[index + 2];

        float cr = (powf(10.0f, (1023.0f * r - 685.0f) / 300.0f) - 0.0108f) / (1.0f - 0.0108f);
        float cg = (powf(10.0f, (1023.0f * g - 685.0f) / 300.0f) - 0.0108f) / (1.0f - 0.0108f);
        float cb = (powf(10.0f, (1023.0f * b - 685.0f) / 300.0f) - 0.0108f) / (1.0f - 0.0108f);

        float lr = r > 0.1496582f ? (powf(10.0f, (r - 0.385537f) / 0.2471896f) - 0.052272f) / 5.555556f 
                                  : (r - 0.092809f) / 5.367655f;
        float lg = g > 0.1496582f ? (powf(10.0f, (g - 0.385537f) / 0.2471896f) - 0.052272f) / 5.555556f 
                                  : (g - 0.092809f) / 5.367655f;
        float lb = b > 0.1496582f ? (powf(10.0f, (b - 0.385537f) / 0.2471896f) - 0.052272f) / 5.555556f 
                                  : (b - 0.092809f) / 5.367655f;

        float mr = lr * 1.617523f + lg * -0.537287f + lb * -0.080237f;
        float mg = lr * -0.070573f + lg * 1.334613f + lb * -0.26404f;
        float mb = lr * -0.021102f + lg * -0.226954f + lb * 1.248056f;

        // Determine the source based on the p_Source parameter
        float sr = (p_Source == 0) ? r : (p_Source == 1) ? cr : mr;
        float sg = (p_Source == 0) ? g : (p_Source == 1) ? cg : mg;
        float sb = (p_Source == 0) ? b : (p_Source == 1) ? cb : mb;

        float Lr = fminf(sr, 1.0f);
        float Lg = fminf(sg, 1.0f);
        float Lb = fminf(sb, 1.0f);

        float Hr = fmaxf(sr, 1.0f) - 1.0f;
        float Hg = fmaxf(sg, 1.0f) - 1.0f;
        float Hb = fmaxf(sb, 1.0f) - 1.0f;

        float rr = p_SoftClipA;
        float gg = p_SoftClipB;
        float aa = p_SoftClipC;
        float bb = p_SoftClipD;
        float ss = 1.0f - (p_SoftClipE / 10.0f);
        float sf = 1.0f - p_SoftClipF;

        float Hrr = Hr * powf(2.0f, rr);
        float Hgg = Hg * powf(2.0f, rr);
        float Hbb = Hb * powf(2.0f, rr);

        float HR = (Hrr <= 1.0f) ? 1.0f - powf(1.0f - Hrr, gg) : Hrr;
        float HG = (Hgg <= 1.0f) ? 1.0f - powf(1.0f - Hgg, gg) : Hgg;
        float HB = (Hbb <= 1.0f) ? 1.0f - powf(1.0f - Hbb, gg) : Hbb;

        float R = Lr + HR;
        float G = Lg + HG;
        float B = Lb + HB;

        // Soft clipping
        float softr = aa == 1.0f ? R : (R > aa ? (-1.0f / ((R - aa) / (bb - aa) + 1.0f) + 1.0f) * (bb - aa) + aa : R);
        float softR = (bb == 1.0f) ? softr : (softr > 1.0f - (bb / 50.0f) ? (-1.0f / ((softr - (1.0f - (bb / 50.0f))) / 
                            (1.0f - (1.0f - (bb / 50.0f))) + 1.0f) + 1.0f) * (1.0f - (1.0f - (bb / 50.0f))) + 
                            (1.0f - (bb / 50.0f)) : softr);
        float softg = aa == 1.0f ? G : (G > aa ? (-1.0f / ((G - aa) / (bb - aa) + 1.0f) + 1.0f) * (bb - aa) + aa : G);
        float softG = bb == 1.0f ? softg : (softg > 1.0f - (bb / 50.0f) ? (-1.0f / ((softg - (1.0f - (bb / 50.0f))) / 
                            (1.0f - (1.0f - (bb / 50.0f))) + 1.0f) + 1.0f) * (1.0f - (1.0f - (bb / 50.0f))) + 
                            (1.0f - (bb / 50.0f)) : softg);
        float softb = aa == 1.0f ? B : (B > aa ? (-1.0f / ((B - aa) / (bb - aa) + 1.0f) + 1.0f) * (bb - aa) + aa : B);
        float softB = bb == 1.0f ? softb : (softb > 1.0f - (bb / 50.0f) ? (-1.0f / ((softb - (1.0f - (bb / 50.0f))) / 
                            (1.0f - (1.0f - (bb / 50.0f))) + 1.0f) + 1.0f) * (1.0f - (1.0f - (bb / 50.0f))) + 
                            (1.0f - (bb / 50.0f)) : softb);

        float Cr = (softR * -1.0f) + 1.0f;
        float Cg = (softG * -1.0f) + 1.0f;
        float Cb = (softB * -1.0f) + 1.0f;

        // Apply soft clipping final transform
        auto softClipFinal = [&](float C) -> float {
            float c = ss == 1.0f ? C : (C > ss ? (-1.0f / ((C - ss) / (sf - ss) + 1.0f) + 1.0f) * (sf - ss) + ss : C);
            return sf == 1.0f ? (c - 1.0f) * -1.0f : 
                                (((c > 1.0f - (-p_SoftClipF / 50.0f) ? (-1.0f / ((c - (1.0f - (-p_SoftClipF / 50.0f))) / 
                                (1.0f - (1.0f - (-p_SoftClipF / 50.0f))) + 1.0f) + 1.0f) * (1.0f - 
                                (1.0f - (-p_SoftClipF / 50.0f))) + (1.0f - (-p_SoftClipF / 50.0f)) : c) - 1.0f) * -1.0f);
        };

        float CR = softClipFinal(Cr);
        float CG = softClipFinal(Cg);
        float CB = softClipFinal(Cb);

        // Apply source specific transform
        auto sourceSpecificTransform = [&](float C) -> float {
            return p_Source == 0 ? C : 
                                  (C >= 0.0f && C <= 1.0f ? (C < 0.0181f ? (C * 4.5f) : 
                                  1.0993f * powf(C, 0.45f) - (1.0993f - 1.0f)) : C);
        };

        float SR = sourceSpecificTransform(CR);
        float SG = sourceSpecificTransform(CG);
        float SB = sourceSpecificTransform(CB);

        // Set output values with switch modifications
        auto setOutputWithSwitch = [&](float C) -> float {
            return p_SwitchA == 1 ? (C < 1.0f ? 1.0f : C) - 1.0f 
                                  : (p_SwitchB == 1 ? (C >= 0.0f ? 0.0f : C + 1.0f) : C);
        };

        p_Output[index] = setOutputWithSwitch(SR);
        p_Output[index + 1] = setOutputWithSwitch(SG);
        p_Output[index + 2] = setOutputWithSwitch(SB);
        p_Output[index + 3] = p_Input[index + 3];
    }
}