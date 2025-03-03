; ModuleID = '../data/hip_kernels/4234/6/main.cu'
source_filename = "../data/hip_kernels/4234/6/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@shared_ = external hidden local_unnamed_addr addrspace(3) global [0 x float], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z18kernel_512_one_128PfS_S_S_S_(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture writeonly %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %9 = shl nuw nsw i32 %8, 7
  %10 = add nuw nsw i32 %9, %7
  %11 = shl nsw i32 %6, 11
  %12 = add i32 %10, %11
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds float, float addrspace(1)* %0, i64 %13
  %15 = load float, float addrspace(1)* %14, align 4, !tbaa !5, !amdgpu.noclobber !9
  %16 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %10
  store float %15, float addrspace(3)* %16, align 4, !tbaa !5
  %17 = add nuw nsw i32 %10, 512
  %18 = add i32 %17, %11
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds float, float addrspace(1)* %0, i64 %19
  %21 = load float, float addrspace(1)* %20, align 4, !tbaa !5, !amdgpu.noclobber !9
  %22 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %17
  store float %21, float addrspace(3)* %22, align 4, !tbaa !5
  %23 = add nuw nsw i32 %10, 1024
  %24 = add i32 %23, %11
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds float, float addrspace(1)* %0, i64 %25
  %27 = load float, float addrspace(1)* %26, align 4, !tbaa !5, !amdgpu.noclobber !9
  %28 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %23
  store float %27, float addrspace(3)* %28, align 4, !tbaa !5
  %29 = add nuw nsw i32 %10, 1536
  %30 = add i32 %29, %11
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds float, float addrspace(1)* %0, i64 %31
  %33 = load float, float addrspace(1)* %32, align 4, !tbaa !5, !amdgpu.noclobber !9
  %34 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %29
  store float %33, float addrspace(3)* %34, align 4, !tbaa !5
  %35 = zext i32 %7 to i64
  %36 = getelementptr inbounds float, float addrspace(1)* %2, i64 %35
  %37 = load float, float addrspace(1)* %36, align 4, !tbaa !5, !amdgpu.noclobber !9
  %38 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 10752), i32 %7
  store float %37, float addrspace(3)* %38, align 4, !tbaa !5
  %39 = getelementptr inbounds float, float addrspace(1)* %3, i64 %35
  %40 = load float, float addrspace(1)* %39, align 4, !tbaa !5, !amdgpu.noclobber !9
  %41 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 10880), i32 %7
  store float %40, float addrspace(3)* %41, align 4, !tbaa !5
  %42 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 10240), i32 %10
  store float 0.000000e+00, float addrspace(3)* %42, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %43 = shl nuw nsw i32 %8, 9
  %44 = zext i32 %10 to i64
  %45 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 2048), i32 %10
  %46 = zext i32 %17 to i64
  %47 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 2048), i32 %17
  %48 = zext i32 %23 to i64
  %49 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 2048), i32 %23
  %50 = zext i32 %29 to i64
  %51 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 2048), i32 %29
  %52 = add nuw nsw i32 %10, 2048
  %53 = zext i32 %52 to i64
  %54 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 2048), i32 %52
  %55 = add nuw nsw i32 %10, 2560
  %56 = zext i32 %55 to i64
  %57 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 2048), i32 %55
  %58 = add nuw nsw i32 %10, 3072
  %59 = zext i32 %58 to i64
  %60 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 2048), i32 %58
  %61 = add nuw nsw i32 %10, 3584
  %62 = zext i32 %61 to i64
  %63 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 2048), i32 %61
  %64 = add nuw nsw i32 %10, 4096
  %65 = zext i32 %64 to i64
  %66 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 2048), i32 %64
  %67 = add nuw nsw i32 %10, 4608
  %68 = zext i32 %67 to i64
  %69 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 2048), i32 %67
  %70 = add nuw nsw i32 %10, 5120
  %71 = zext i32 %70 to i64
  %72 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 2048), i32 %70
  %73 = add nuw nsw i32 %10, 5632
  %74 = zext i32 %73 to i64
  %75 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 2048), i32 %73
  %76 = add nuw nsw i32 %10, 6144
  %77 = zext i32 %76 to i64
  %78 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 2048), i32 %76
  %79 = add nuw nsw i32 %10, 6656
  %80 = zext i32 %79 to i64
  %81 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 2048), i32 %79
  %82 = add nuw nsw i32 %10, 7168
  %83 = zext i32 %82 to i64
  %84 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 2048), i32 %82
  %85 = add nuw nsw i32 %10, 7680
  %86 = zext i32 %85 to i64
  %87 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 2048), i32 %85
  %88 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 2048), i32 %7
  %89 = add nuw nsw i32 %43, 1
  %90 = add nuw nsw i32 %7, 128
  %91 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 2048), i32 %90
  %92 = add nuw nsw i32 %43, 2
  %93 = add nuw nsw i32 %7, 256
  %94 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 2048), i32 %93
  %95 = add nuw nsw i32 %43, 3
  %96 = add nuw nsw i32 %7, 384
  %97 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 2048), i32 %96
  %98 = add nuw nsw i32 %43, 4
  %99 = add nuw nsw i32 %7, 512
  %100 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 2048), i32 %99
  %101 = add nuw nsw i32 %43, 5
  %102 = add nuw nsw i32 %7, 640
  %103 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 2048), i32 %102
  %104 = add nuw nsw i32 %43, 6
  %105 = add nuw nsw i32 %7, 768
  %106 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 2048), i32 %105
  %107 = add nuw nsw i32 %43, 7
  %108 = add nuw nsw i32 %7, 896
  %109 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 2048), i32 %108
  %110 = add nuw nsw i32 %43, 8
  %111 = or i32 %7, 1024
  %112 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 2048), i32 %111
  %113 = add nuw nsw i32 %43, 9
  %114 = add nuw nsw i32 %7, 1152
  %115 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 2048), i32 %114
  %116 = add nuw nsw i32 %43, 10
  %117 = add nuw nsw i32 %7, 1280
  %118 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 2048), i32 %117
  %119 = add nuw nsw i32 %43, 11
  %120 = add nuw nsw i32 %7, 1408
  %121 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 2048), i32 %120
  %122 = add nuw nsw i32 %43, 12
  %123 = add nuw nsw i32 %7, 1536
  %124 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 2048), i32 %123
  %125 = add nuw nsw i32 %43, 13
  %126 = add nuw nsw i32 %7, 1664
  %127 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 2048), i32 %126
  %128 = add nuw nsw i32 %43, 14
  %129 = add nuw nsw i32 %7, 1792
  %130 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 2048), i32 %129
  %131 = add nuw nsw i32 %43, 15
  %132 = add nuw nsw i32 %7, 1920
  %133 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 2048), i32 %132
  %134 = add nuw nsw i32 %43, 16
  %135 = or i32 %7, 2048
  %136 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 2048), i32 %135
  %137 = add nuw nsw i32 %43, 17
  %138 = add nuw nsw i32 %7, 2176
  %139 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 2048), i32 %138
  %140 = add nuw nsw i32 %43, 18
  %141 = add nuw nsw i32 %7, 2304
  %142 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 2048), i32 %141
  %143 = add nuw nsw i32 %43, 19
  %144 = add nuw nsw i32 %7, 2432
  %145 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 2048), i32 %144
  %146 = add nuw nsw i32 %43, 20
  %147 = add nuw nsw i32 %7, 2560
  %148 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 2048), i32 %147
  %149 = add nuw nsw i32 %43, 21
  %150 = add nuw nsw i32 %7, 2688
  %151 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 2048), i32 %150
  %152 = add nuw nsw i32 %43, 22
  %153 = add nuw nsw i32 %7, 2816
  %154 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 2048), i32 %153
  %155 = add nuw nsw i32 %43, 23
  %156 = add nuw nsw i32 %7, 2944
  %157 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 2048), i32 %156
  %158 = add nuw nsw i32 %43, 24
  %159 = or i32 %7, 3072
  %160 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 2048), i32 %159
  %161 = add nuw nsw i32 %43, 25
  %162 = add nuw nsw i32 %7, 3200
  %163 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 2048), i32 %162
  %164 = add nuw nsw i32 %43, 26
  %165 = add nuw nsw i32 %7, 3328
  %166 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 2048), i32 %165
  %167 = add nuw nsw i32 %43, 27
  %168 = add nuw nsw i32 %7, 3456
  %169 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 2048), i32 %168
  %170 = add nuw nsw i32 %43, 28
  %171 = add nuw nsw i32 %7, 3584
  %172 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 2048), i32 %171
  %173 = add nuw nsw i32 %43, 29
  %174 = add nuw nsw i32 %7, 3712
  %175 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 2048), i32 %174
  %176 = add nuw nsw i32 %43, 30
  %177 = add nuw nsw i32 %7, 3840
  %178 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 2048), i32 %177
  %179 = add nuw nsw i32 %43, 31
  %180 = add nuw nsw i32 %7, 3968
  %181 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 2048), i32 %180
  %182 = add nuw nsw i32 %43, 32
  %183 = or i32 %7, 4096
  %184 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 2048), i32 %183
  %185 = add nuw nsw i32 %43, 33
  %186 = add nuw nsw i32 %7, 4224
  %187 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 2048), i32 %186
  %188 = add nuw nsw i32 %43, 34
  %189 = add nuw nsw i32 %7, 4352
  %190 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 2048), i32 %189
  %191 = add nuw nsw i32 %43, 35
  %192 = add nuw nsw i32 %7, 4480
  %193 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 2048), i32 %192
  %194 = add nuw nsw i32 %43, 36
  %195 = add nuw nsw i32 %7, 4608
  %196 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 2048), i32 %195
  %197 = add nuw nsw i32 %43, 37
  %198 = add nuw nsw i32 %7, 4736
  %199 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 2048), i32 %198
  %200 = add nuw nsw i32 %43, 38
  %201 = add nuw nsw i32 %7, 4864
  %202 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 2048), i32 %201
  %203 = add nuw nsw i32 %43, 39
  %204 = add nuw nsw i32 %7, 4992
  %205 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 2048), i32 %204
  %206 = add nuw nsw i32 %43, 40
  %207 = or i32 %7, 5120
  %208 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 2048), i32 %207
  %209 = add nuw nsw i32 %43, 41
  %210 = add nuw nsw i32 %7, 5248
  %211 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 2048), i32 %210
  %212 = add nuw nsw i32 %43, 42
  %213 = add nuw nsw i32 %7, 5376
  %214 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 2048), i32 %213
  %215 = add nuw nsw i32 %43, 43
  %216 = add nuw nsw i32 %7, 5504
  %217 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 2048), i32 %216
  %218 = add nuw nsw i32 %43, 44
  %219 = add nuw nsw i32 %7, 5632
  %220 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 2048), i32 %219
  %221 = add nuw nsw i32 %43, 45
  %222 = add nuw nsw i32 %7, 5760
  %223 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 2048), i32 %222
  %224 = add nuw nsw i32 %43, 46
  %225 = add nuw nsw i32 %7, 5888
  %226 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 2048), i32 %225
  %227 = add nuw nsw i32 %43, 47
  %228 = add nuw nsw i32 %7, 6016
  %229 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 2048), i32 %228
  %230 = add nuw nsw i32 %43, 48
  %231 = or i32 %7, 6144
  %232 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 2048), i32 %231
  %233 = add nuw nsw i32 %43, 49
  %234 = add nuw nsw i32 %7, 6272
  %235 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 2048), i32 %234
  %236 = add nuw nsw i32 %43, 50
  %237 = add nuw nsw i32 %7, 6400
  %238 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 2048), i32 %237
  %239 = add nuw nsw i32 %43, 51
  %240 = add nuw nsw i32 %7, 6528
  %241 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 2048), i32 %240
  %242 = add nuw nsw i32 %43, 52
  %243 = add nuw nsw i32 %7, 6656
  %244 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 2048), i32 %243
  %245 = add nuw nsw i32 %43, 53
  %246 = add nuw nsw i32 %7, 6784
  %247 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 2048), i32 %246
  %248 = add nuw nsw i32 %43, 54
  %249 = add nuw nsw i32 %7, 6912
  %250 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 2048), i32 %249
  %251 = add nuw nsw i32 %43, 55
  %252 = add nuw nsw i32 %7, 7040
  %253 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 2048), i32 %252
  %254 = add nuw nsw i32 %43, 56
  %255 = or i32 %7, 7168
  %256 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 2048), i32 %255
  %257 = add nuw nsw i32 %43, 57
  %258 = add nuw nsw i32 %7, 7296
  %259 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 2048), i32 %258
  %260 = add nuw nsw i32 %43, 58
  %261 = add nuw nsw i32 %7, 7424
  %262 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 2048), i32 %261
  %263 = add nuw nsw i32 %43, 59
  %264 = add nuw nsw i32 %7, 7552
  %265 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 2048), i32 %264
  %266 = add nuw nsw i32 %43, 60
  %267 = add nuw nsw i32 %7, 7680
  %268 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 2048), i32 %267
  %269 = add nuw nsw i32 %43, 61
  %270 = add nuw nsw i32 %7, 7808
  %271 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 2048), i32 %270
  %272 = add nuw nsw i32 %43, 62
  %273 = add nuw nsw i32 %7, 7936
  %274 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 2048), i32 %273
  %275 = add nuw nsw i32 %43, 63
  %276 = add nuw nsw i32 %7, 8064
  %277 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 2048), i32 %276
  %278 = getelementptr inbounds float, float addrspace(1)* %1, i64 %44
  %279 = load float, float addrspace(1)* %278, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %279, float addrspace(3)* %45, align 4, !tbaa !5
  %280 = getelementptr inbounds float, float addrspace(1)* %1, i64 %46
  %281 = load float, float addrspace(1)* %280, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %281, float addrspace(3)* %47, align 4, !tbaa !5
  %282 = getelementptr inbounds float, float addrspace(1)* %1, i64 %48
  %283 = load float, float addrspace(1)* %282, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %283, float addrspace(3)* %49, align 4, !tbaa !5
  %284 = getelementptr inbounds float, float addrspace(1)* %1, i64 %50
  %285 = load float, float addrspace(1)* %284, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %285, float addrspace(3)* %51, align 4, !tbaa !5
  %286 = getelementptr inbounds float, float addrspace(1)* %1, i64 %53
  %287 = load float, float addrspace(1)* %286, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %287, float addrspace(3)* %54, align 4, !tbaa !5
  %288 = getelementptr inbounds float, float addrspace(1)* %1, i64 %56
  %289 = load float, float addrspace(1)* %288, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %289, float addrspace(3)* %57, align 4, !tbaa !5
  %290 = getelementptr inbounds float, float addrspace(1)* %1, i64 %59
  %291 = load float, float addrspace(1)* %290, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %291, float addrspace(3)* %60, align 4, !tbaa !5
  %292 = getelementptr inbounds float, float addrspace(1)* %1, i64 %62
  %293 = load float, float addrspace(1)* %292, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %293, float addrspace(3)* %63, align 4, !tbaa !5
  %294 = getelementptr inbounds float, float addrspace(1)* %1, i64 %65
  %295 = load float, float addrspace(1)* %294, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %295, float addrspace(3)* %66, align 4, !tbaa !5
  %296 = getelementptr inbounds float, float addrspace(1)* %1, i64 %68
  %297 = load float, float addrspace(1)* %296, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %297, float addrspace(3)* %69, align 4, !tbaa !5
  %298 = getelementptr inbounds float, float addrspace(1)* %1, i64 %71
  %299 = load float, float addrspace(1)* %298, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %299, float addrspace(3)* %72, align 4, !tbaa !5
  %300 = getelementptr inbounds float, float addrspace(1)* %1, i64 %74
  %301 = load float, float addrspace(1)* %300, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %301, float addrspace(3)* %75, align 4, !tbaa !5
  %302 = getelementptr inbounds float, float addrspace(1)* %1, i64 %77
  %303 = load float, float addrspace(1)* %302, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %303, float addrspace(3)* %78, align 4, !tbaa !5
  %304 = getelementptr inbounds float, float addrspace(1)* %1, i64 %80
  %305 = load float, float addrspace(1)* %304, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %305, float addrspace(3)* %81, align 4, !tbaa !5
  %306 = getelementptr inbounds float, float addrspace(1)* %1, i64 %83
  %307 = load float, float addrspace(1)* %306, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %307, float addrspace(3)* %84, align 4, !tbaa !5
  %308 = getelementptr inbounds float, float addrspace(1)* %1, i64 %86
  %309 = load float, float addrspace(1)* %308, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %309, float addrspace(3)* %87, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %310 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %43
  %311 = load float, float addrspace(3)* %310, align 4, !tbaa !5
  %312 = load float, float addrspace(3)* %88, align 4, !tbaa !5
  %313 = fmul contract float %311, %312
  %314 = load float, float addrspace(3)* %42, align 4, !tbaa !5
  %315 = fadd contract float %314, %313
  store float %315, float addrspace(3)* %42, align 4, !tbaa !5
  %316 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %89
  %317 = load float, float addrspace(3)* %316, align 4, !tbaa !5
  %318 = load float, float addrspace(3)* %91, align 4, !tbaa !5
  %319 = fmul contract float %317, %318
  %320 = fadd contract float %315, %319
  store float %320, float addrspace(3)* %42, align 4, !tbaa !5
  %321 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %92
  %322 = load float, float addrspace(3)* %321, align 4, !tbaa !5
  %323 = load float, float addrspace(3)* %94, align 4, !tbaa !5
  %324 = fmul contract float %322, %323
  %325 = fadd contract float %320, %324
  store float %325, float addrspace(3)* %42, align 4, !tbaa !5
  %326 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %95
  %327 = load float, float addrspace(3)* %326, align 4, !tbaa !5
  %328 = load float, float addrspace(3)* %97, align 4, !tbaa !5
  %329 = fmul contract float %327, %328
  %330 = fadd contract float %325, %329
  store float %330, float addrspace(3)* %42, align 4, !tbaa !5
  %331 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %98
  %332 = load float, float addrspace(3)* %331, align 4, !tbaa !5
  %333 = load float, float addrspace(3)* %100, align 4, !tbaa !5
  %334 = fmul contract float %332, %333
  %335 = fadd contract float %330, %334
  store float %335, float addrspace(3)* %42, align 4, !tbaa !5
  %336 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %101
  %337 = load float, float addrspace(3)* %336, align 4, !tbaa !5
  %338 = load float, float addrspace(3)* %103, align 4, !tbaa !5
  %339 = fmul contract float %337, %338
  %340 = fadd contract float %335, %339
  store float %340, float addrspace(3)* %42, align 4, !tbaa !5
  %341 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %104
  %342 = load float, float addrspace(3)* %341, align 4, !tbaa !5
  %343 = load float, float addrspace(3)* %106, align 4, !tbaa !5
  %344 = fmul contract float %342, %343
  %345 = fadd contract float %340, %344
  store float %345, float addrspace(3)* %42, align 4, !tbaa !5
  %346 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %107
  %347 = load float, float addrspace(3)* %346, align 4, !tbaa !5
  %348 = load float, float addrspace(3)* %109, align 4, !tbaa !5
  %349 = fmul contract float %347, %348
  %350 = fadd contract float %345, %349
  store float %350, float addrspace(3)* %42, align 4, !tbaa !5
  %351 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %110
  %352 = load float, float addrspace(3)* %351, align 4, !tbaa !5
  %353 = load float, float addrspace(3)* %112, align 4, !tbaa !5
  %354 = fmul contract float %352, %353
  %355 = fadd contract float %350, %354
  store float %355, float addrspace(3)* %42, align 4, !tbaa !5
  %356 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %113
  %357 = load float, float addrspace(3)* %356, align 4, !tbaa !5
  %358 = load float, float addrspace(3)* %115, align 4, !tbaa !5
  %359 = fmul contract float %357, %358
  %360 = fadd contract float %355, %359
  store float %360, float addrspace(3)* %42, align 4, !tbaa !5
  %361 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %116
  %362 = load float, float addrspace(3)* %361, align 4, !tbaa !5
  %363 = load float, float addrspace(3)* %118, align 4, !tbaa !5
  %364 = fmul contract float %362, %363
  %365 = fadd contract float %360, %364
  store float %365, float addrspace(3)* %42, align 4, !tbaa !5
  %366 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %119
  %367 = load float, float addrspace(3)* %366, align 4, !tbaa !5
  %368 = load float, float addrspace(3)* %121, align 4, !tbaa !5
  %369 = fmul contract float %367, %368
  %370 = fadd contract float %365, %369
  store float %370, float addrspace(3)* %42, align 4, !tbaa !5
  %371 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %122
  %372 = load float, float addrspace(3)* %371, align 4, !tbaa !5
  %373 = load float, float addrspace(3)* %124, align 4, !tbaa !5
  %374 = fmul contract float %372, %373
  %375 = fadd contract float %370, %374
  store float %375, float addrspace(3)* %42, align 4, !tbaa !5
  %376 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %125
  %377 = load float, float addrspace(3)* %376, align 4, !tbaa !5
  %378 = load float, float addrspace(3)* %127, align 4, !tbaa !5
  %379 = fmul contract float %377, %378
  %380 = fadd contract float %375, %379
  store float %380, float addrspace(3)* %42, align 4, !tbaa !5
  %381 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %128
  %382 = load float, float addrspace(3)* %381, align 4, !tbaa !5
  %383 = load float, float addrspace(3)* %130, align 4, !tbaa !5
  %384 = fmul contract float %382, %383
  %385 = fadd contract float %380, %384
  store float %385, float addrspace(3)* %42, align 4, !tbaa !5
  %386 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %131
  %387 = load float, float addrspace(3)* %386, align 4, !tbaa !5
  %388 = load float, float addrspace(3)* %133, align 4, !tbaa !5
  %389 = fmul contract float %387, %388
  %390 = fadd contract float %385, %389
  store float %390, float addrspace(3)* %42, align 4, !tbaa !5
  %391 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %134
  %392 = load float, float addrspace(3)* %391, align 4, !tbaa !5
  %393 = load float, float addrspace(3)* %136, align 4, !tbaa !5
  %394 = fmul contract float %392, %393
  %395 = fadd contract float %390, %394
  store float %395, float addrspace(3)* %42, align 4, !tbaa !5
  %396 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %137
  %397 = load float, float addrspace(3)* %396, align 4, !tbaa !5
  %398 = load float, float addrspace(3)* %139, align 4, !tbaa !5
  %399 = fmul contract float %397, %398
  %400 = fadd contract float %395, %399
  store float %400, float addrspace(3)* %42, align 4, !tbaa !5
  %401 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %140
  %402 = load float, float addrspace(3)* %401, align 4, !tbaa !5
  %403 = load float, float addrspace(3)* %142, align 4, !tbaa !5
  %404 = fmul contract float %402, %403
  %405 = fadd contract float %400, %404
  store float %405, float addrspace(3)* %42, align 4, !tbaa !5
  %406 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %143
  %407 = load float, float addrspace(3)* %406, align 4, !tbaa !5
  %408 = load float, float addrspace(3)* %145, align 4, !tbaa !5
  %409 = fmul contract float %407, %408
  %410 = fadd contract float %405, %409
  store float %410, float addrspace(3)* %42, align 4, !tbaa !5
  %411 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %146
  %412 = load float, float addrspace(3)* %411, align 4, !tbaa !5
  %413 = load float, float addrspace(3)* %148, align 4, !tbaa !5
  %414 = fmul contract float %412, %413
  %415 = fadd contract float %410, %414
  store float %415, float addrspace(3)* %42, align 4, !tbaa !5
  %416 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %149
  %417 = load float, float addrspace(3)* %416, align 4, !tbaa !5
  %418 = load float, float addrspace(3)* %151, align 4, !tbaa !5
  %419 = fmul contract float %417, %418
  %420 = fadd contract float %415, %419
  store float %420, float addrspace(3)* %42, align 4, !tbaa !5
  %421 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %152
  %422 = load float, float addrspace(3)* %421, align 4, !tbaa !5
  %423 = load float, float addrspace(3)* %154, align 4, !tbaa !5
  %424 = fmul contract float %422, %423
  %425 = fadd contract float %420, %424
  store float %425, float addrspace(3)* %42, align 4, !tbaa !5
  %426 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %155
  %427 = load float, float addrspace(3)* %426, align 4, !tbaa !5
  %428 = load float, float addrspace(3)* %157, align 4, !tbaa !5
  %429 = fmul contract float %427, %428
  %430 = fadd contract float %425, %429
  store float %430, float addrspace(3)* %42, align 4, !tbaa !5
  %431 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %158
  %432 = load float, float addrspace(3)* %431, align 4, !tbaa !5
  %433 = load float, float addrspace(3)* %160, align 4, !tbaa !5
  %434 = fmul contract float %432, %433
  %435 = fadd contract float %430, %434
  store float %435, float addrspace(3)* %42, align 4, !tbaa !5
  %436 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %161
  %437 = load float, float addrspace(3)* %436, align 4, !tbaa !5
  %438 = load float, float addrspace(3)* %163, align 4, !tbaa !5
  %439 = fmul contract float %437, %438
  %440 = fadd contract float %435, %439
  store float %440, float addrspace(3)* %42, align 4, !tbaa !5
  %441 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %164
  %442 = load float, float addrspace(3)* %441, align 4, !tbaa !5
  %443 = load float, float addrspace(3)* %166, align 4, !tbaa !5
  %444 = fmul contract float %442, %443
  %445 = fadd contract float %440, %444
  store float %445, float addrspace(3)* %42, align 4, !tbaa !5
  %446 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %167
  %447 = load float, float addrspace(3)* %446, align 4, !tbaa !5
  %448 = load float, float addrspace(3)* %169, align 4, !tbaa !5
  %449 = fmul contract float %447, %448
  %450 = fadd contract float %445, %449
  store float %450, float addrspace(3)* %42, align 4, !tbaa !5
  %451 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %170
  %452 = load float, float addrspace(3)* %451, align 4, !tbaa !5
  %453 = load float, float addrspace(3)* %172, align 4, !tbaa !5
  %454 = fmul contract float %452, %453
  %455 = fadd contract float %450, %454
  store float %455, float addrspace(3)* %42, align 4, !tbaa !5
  %456 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %173
  %457 = load float, float addrspace(3)* %456, align 4, !tbaa !5
  %458 = load float, float addrspace(3)* %175, align 4, !tbaa !5
  %459 = fmul contract float %457, %458
  %460 = fadd contract float %455, %459
  store float %460, float addrspace(3)* %42, align 4, !tbaa !5
  %461 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %176
  %462 = load float, float addrspace(3)* %461, align 4, !tbaa !5
  %463 = load float, float addrspace(3)* %178, align 4, !tbaa !5
  %464 = fmul contract float %462, %463
  %465 = fadd contract float %460, %464
  store float %465, float addrspace(3)* %42, align 4, !tbaa !5
  %466 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %179
  %467 = load float, float addrspace(3)* %466, align 4, !tbaa !5
  %468 = load float, float addrspace(3)* %181, align 4, !tbaa !5
  %469 = fmul contract float %467, %468
  %470 = fadd contract float %465, %469
  store float %470, float addrspace(3)* %42, align 4, !tbaa !5
  %471 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %182
  %472 = load float, float addrspace(3)* %471, align 4, !tbaa !5
  %473 = load float, float addrspace(3)* %184, align 4, !tbaa !5
  %474 = fmul contract float %472, %473
  %475 = fadd contract float %470, %474
  store float %475, float addrspace(3)* %42, align 4, !tbaa !5
  %476 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %185
  %477 = load float, float addrspace(3)* %476, align 4, !tbaa !5
  %478 = load float, float addrspace(3)* %187, align 4, !tbaa !5
  %479 = fmul contract float %477, %478
  %480 = fadd contract float %475, %479
  store float %480, float addrspace(3)* %42, align 4, !tbaa !5
  %481 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %188
  %482 = load float, float addrspace(3)* %481, align 4, !tbaa !5
  %483 = load float, float addrspace(3)* %190, align 4, !tbaa !5
  %484 = fmul contract float %482, %483
  %485 = fadd contract float %480, %484
  store float %485, float addrspace(3)* %42, align 4, !tbaa !5
  %486 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %191
  %487 = load float, float addrspace(3)* %486, align 4, !tbaa !5
  %488 = load float, float addrspace(3)* %193, align 4, !tbaa !5
  %489 = fmul contract float %487, %488
  %490 = fadd contract float %485, %489
  store float %490, float addrspace(3)* %42, align 4, !tbaa !5
  %491 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %194
  %492 = load float, float addrspace(3)* %491, align 4, !tbaa !5
  %493 = load float, float addrspace(3)* %196, align 4, !tbaa !5
  %494 = fmul contract float %492, %493
  %495 = fadd contract float %490, %494
  store float %495, float addrspace(3)* %42, align 4, !tbaa !5
  %496 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %197
  %497 = load float, float addrspace(3)* %496, align 4, !tbaa !5
  %498 = load float, float addrspace(3)* %199, align 4, !tbaa !5
  %499 = fmul contract float %497, %498
  %500 = fadd contract float %495, %499
  store float %500, float addrspace(3)* %42, align 4, !tbaa !5
  %501 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %200
  %502 = load float, float addrspace(3)* %501, align 4, !tbaa !5
  %503 = load float, float addrspace(3)* %202, align 4, !tbaa !5
  %504 = fmul contract float %502, %503
  %505 = fadd contract float %500, %504
  store float %505, float addrspace(3)* %42, align 4, !tbaa !5
  %506 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %203
  %507 = load float, float addrspace(3)* %506, align 4, !tbaa !5
  %508 = load float, float addrspace(3)* %205, align 4, !tbaa !5
  %509 = fmul contract float %507, %508
  %510 = fadd contract float %505, %509
  store float %510, float addrspace(3)* %42, align 4, !tbaa !5
  %511 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %206
  %512 = load float, float addrspace(3)* %511, align 4, !tbaa !5
  %513 = load float, float addrspace(3)* %208, align 4, !tbaa !5
  %514 = fmul contract float %512, %513
  %515 = fadd contract float %510, %514
  store float %515, float addrspace(3)* %42, align 4, !tbaa !5
  %516 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %209
  %517 = load float, float addrspace(3)* %516, align 4, !tbaa !5
  %518 = load float, float addrspace(3)* %211, align 4, !tbaa !5
  %519 = fmul contract float %517, %518
  %520 = fadd contract float %515, %519
  store float %520, float addrspace(3)* %42, align 4, !tbaa !5
  %521 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %212
  %522 = load float, float addrspace(3)* %521, align 4, !tbaa !5
  %523 = load float, float addrspace(3)* %214, align 4, !tbaa !5
  %524 = fmul contract float %522, %523
  %525 = fadd contract float %520, %524
  store float %525, float addrspace(3)* %42, align 4, !tbaa !5
  %526 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %215
  %527 = load float, float addrspace(3)* %526, align 4, !tbaa !5
  %528 = load float, float addrspace(3)* %217, align 4, !tbaa !5
  %529 = fmul contract float %527, %528
  %530 = fadd contract float %525, %529
  store float %530, float addrspace(3)* %42, align 4, !tbaa !5
  %531 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %218
  %532 = load float, float addrspace(3)* %531, align 4, !tbaa !5
  %533 = load float, float addrspace(3)* %220, align 4, !tbaa !5
  %534 = fmul contract float %532, %533
  %535 = fadd contract float %530, %534
  store float %535, float addrspace(3)* %42, align 4, !tbaa !5
  %536 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %221
  %537 = load float, float addrspace(3)* %536, align 4, !tbaa !5
  %538 = load float, float addrspace(3)* %223, align 4, !tbaa !5
  %539 = fmul contract float %537, %538
  %540 = fadd contract float %535, %539
  store float %540, float addrspace(3)* %42, align 4, !tbaa !5
  %541 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %224
  %542 = load float, float addrspace(3)* %541, align 4, !tbaa !5
  %543 = load float, float addrspace(3)* %226, align 4, !tbaa !5
  %544 = fmul contract float %542, %543
  %545 = fadd contract float %540, %544
  store float %545, float addrspace(3)* %42, align 4, !tbaa !5
  %546 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %227
  %547 = load float, float addrspace(3)* %546, align 4, !tbaa !5
  %548 = load float, float addrspace(3)* %229, align 4, !tbaa !5
  %549 = fmul contract float %547, %548
  %550 = fadd contract float %545, %549
  store float %550, float addrspace(3)* %42, align 4, !tbaa !5
  %551 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %230
  %552 = load float, float addrspace(3)* %551, align 4, !tbaa !5
  %553 = load float, float addrspace(3)* %232, align 4, !tbaa !5
  %554 = fmul contract float %552, %553
  %555 = fadd contract float %550, %554
  store float %555, float addrspace(3)* %42, align 4, !tbaa !5
  %556 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %233
  %557 = load float, float addrspace(3)* %556, align 4, !tbaa !5
  %558 = load float, float addrspace(3)* %235, align 4, !tbaa !5
  %559 = fmul contract float %557, %558
  %560 = fadd contract float %555, %559
  store float %560, float addrspace(3)* %42, align 4, !tbaa !5
  %561 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %236
  %562 = load float, float addrspace(3)* %561, align 4, !tbaa !5
  %563 = load float, float addrspace(3)* %238, align 4, !tbaa !5
  %564 = fmul contract float %562, %563
  %565 = fadd contract float %560, %564
  store float %565, float addrspace(3)* %42, align 4, !tbaa !5
  %566 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %239
  %567 = load float, float addrspace(3)* %566, align 4, !tbaa !5
  %568 = load float, float addrspace(3)* %241, align 4, !tbaa !5
  %569 = fmul contract float %567, %568
  %570 = fadd contract float %565, %569
  store float %570, float addrspace(3)* %42, align 4, !tbaa !5
  %571 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %242
  %572 = load float, float addrspace(3)* %571, align 4, !tbaa !5
  %573 = load float, float addrspace(3)* %244, align 4, !tbaa !5
  %574 = fmul contract float %572, %573
  %575 = fadd contract float %570, %574
  store float %575, float addrspace(3)* %42, align 4, !tbaa !5
  %576 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %245
  %577 = load float, float addrspace(3)* %576, align 4, !tbaa !5
  %578 = load float, float addrspace(3)* %247, align 4, !tbaa !5
  %579 = fmul contract float %577, %578
  %580 = fadd contract float %575, %579
  store float %580, float addrspace(3)* %42, align 4, !tbaa !5
  %581 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %248
  %582 = load float, float addrspace(3)* %581, align 4, !tbaa !5
  %583 = load float, float addrspace(3)* %250, align 4, !tbaa !5
  %584 = fmul contract float %582, %583
  %585 = fadd contract float %580, %584
  store float %585, float addrspace(3)* %42, align 4, !tbaa !5
  %586 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %251
  %587 = load float, float addrspace(3)* %586, align 4, !tbaa !5
  %588 = load float, float addrspace(3)* %253, align 4, !tbaa !5
  %589 = fmul contract float %587, %588
  %590 = fadd contract float %585, %589
  store float %590, float addrspace(3)* %42, align 4, !tbaa !5
  %591 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %254
  %592 = load float, float addrspace(3)* %591, align 4, !tbaa !5
  %593 = load float, float addrspace(3)* %256, align 4, !tbaa !5
  %594 = fmul contract float %592, %593
  %595 = fadd contract float %590, %594
  store float %595, float addrspace(3)* %42, align 4, !tbaa !5
  %596 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %257
  %597 = load float, float addrspace(3)* %596, align 4, !tbaa !5
  %598 = load float, float addrspace(3)* %259, align 4, !tbaa !5
  %599 = fmul contract float %597, %598
  %600 = fadd contract float %595, %599
  store float %600, float addrspace(3)* %42, align 4, !tbaa !5
  %601 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %260
  %602 = load float, float addrspace(3)* %601, align 4, !tbaa !5
  %603 = load float, float addrspace(3)* %262, align 4, !tbaa !5
  %604 = fmul contract float %602, %603
  %605 = fadd contract float %600, %604
  store float %605, float addrspace(3)* %42, align 4, !tbaa !5
  %606 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %263
  %607 = load float, float addrspace(3)* %606, align 4, !tbaa !5
  %608 = load float, float addrspace(3)* %265, align 4, !tbaa !5
  %609 = fmul contract float %607, %608
  %610 = fadd contract float %605, %609
  store float %610, float addrspace(3)* %42, align 4, !tbaa !5
  %611 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %266
  %612 = load float, float addrspace(3)* %611, align 4, !tbaa !5
  %613 = load float, float addrspace(3)* %268, align 4, !tbaa !5
  %614 = fmul contract float %612, %613
  %615 = fadd contract float %610, %614
  store float %615, float addrspace(3)* %42, align 4, !tbaa !5
  %616 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %269
  %617 = load float, float addrspace(3)* %616, align 4, !tbaa !5
  %618 = load float, float addrspace(3)* %271, align 4, !tbaa !5
  %619 = fmul contract float %617, %618
  %620 = fadd contract float %615, %619
  store float %620, float addrspace(3)* %42, align 4, !tbaa !5
  %621 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %272
  %622 = load float, float addrspace(3)* %621, align 4, !tbaa !5
  %623 = load float, float addrspace(3)* %274, align 4, !tbaa !5
  %624 = fmul contract float %622, %623
  %625 = fadd contract float %620, %624
  store float %625, float addrspace(3)* %42, align 4, !tbaa !5
  %626 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %275
  %627 = load float, float addrspace(3)* %626, align 4, !tbaa !5
  %628 = load float, float addrspace(3)* %277, align 4, !tbaa !5
  %629 = fmul contract float %627, %628
  %630 = fadd contract float %625, %629
  store float %630, float addrspace(3)* %42, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %631 = getelementptr inbounds float, float addrspace(1)* %1, i64 8192
  %632 = getelementptr inbounds float, float addrspace(1)* %631, i64 %44
  %633 = load float, float addrspace(1)* %632, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %633, float addrspace(3)* %45, align 4, !tbaa !5
  %634 = getelementptr inbounds float, float addrspace(1)* %631, i64 %46
  %635 = load float, float addrspace(1)* %634, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %635, float addrspace(3)* %47, align 4, !tbaa !5
  %636 = getelementptr inbounds float, float addrspace(1)* %631, i64 %48
  %637 = load float, float addrspace(1)* %636, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %637, float addrspace(3)* %49, align 4, !tbaa !5
  %638 = getelementptr inbounds float, float addrspace(1)* %631, i64 %50
  %639 = load float, float addrspace(1)* %638, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %639, float addrspace(3)* %51, align 4, !tbaa !5
  %640 = getelementptr inbounds float, float addrspace(1)* %631, i64 %53
  %641 = load float, float addrspace(1)* %640, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %641, float addrspace(3)* %54, align 4, !tbaa !5
  %642 = getelementptr inbounds float, float addrspace(1)* %631, i64 %56
  %643 = load float, float addrspace(1)* %642, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %643, float addrspace(3)* %57, align 4, !tbaa !5
  %644 = getelementptr inbounds float, float addrspace(1)* %631, i64 %59
  %645 = load float, float addrspace(1)* %644, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %645, float addrspace(3)* %60, align 4, !tbaa !5
  %646 = getelementptr inbounds float, float addrspace(1)* %631, i64 %62
  %647 = load float, float addrspace(1)* %646, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %647, float addrspace(3)* %63, align 4, !tbaa !5
  %648 = getelementptr inbounds float, float addrspace(1)* %631, i64 %65
  %649 = load float, float addrspace(1)* %648, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %649, float addrspace(3)* %66, align 4, !tbaa !5
  %650 = getelementptr inbounds float, float addrspace(1)* %631, i64 %68
  %651 = load float, float addrspace(1)* %650, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %651, float addrspace(3)* %69, align 4, !tbaa !5
  %652 = getelementptr inbounds float, float addrspace(1)* %631, i64 %71
  %653 = load float, float addrspace(1)* %652, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %653, float addrspace(3)* %72, align 4, !tbaa !5
  %654 = getelementptr inbounds float, float addrspace(1)* %631, i64 %74
  %655 = load float, float addrspace(1)* %654, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %655, float addrspace(3)* %75, align 4, !tbaa !5
  %656 = getelementptr inbounds float, float addrspace(1)* %631, i64 %77
  %657 = load float, float addrspace(1)* %656, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %657, float addrspace(3)* %78, align 4, !tbaa !5
  %658 = getelementptr inbounds float, float addrspace(1)* %631, i64 %80
  %659 = load float, float addrspace(1)* %658, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %659, float addrspace(3)* %81, align 4, !tbaa !5
  %660 = getelementptr inbounds float, float addrspace(1)* %631, i64 %83
  %661 = load float, float addrspace(1)* %660, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %661, float addrspace(3)* %84, align 4, !tbaa !5
  %662 = getelementptr inbounds float, float addrspace(1)* %631, i64 %86
  %663 = load float, float addrspace(1)* %662, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %663, float addrspace(3)* %87, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %664 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %43
  %665 = load float, float addrspace(3)* %664, align 4, !tbaa !5
  %666 = load float, float addrspace(3)* %88, align 4, !tbaa !5
  %667 = fmul contract float %665, %666
  %668 = load float, float addrspace(3)* %42, align 4, !tbaa !5
  %669 = fadd contract float %668, %667
  store float %669, float addrspace(3)* %42, align 4, !tbaa !5
  %670 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %89
  %671 = load float, float addrspace(3)* %670, align 4, !tbaa !5
  %672 = load float, float addrspace(3)* %91, align 4, !tbaa !5
  %673 = fmul contract float %671, %672
  %674 = fadd contract float %669, %673
  store float %674, float addrspace(3)* %42, align 4, !tbaa !5
  %675 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %92
  %676 = load float, float addrspace(3)* %675, align 4, !tbaa !5
  %677 = load float, float addrspace(3)* %94, align 4, !tbaa !5
  %678 = fmul contract float %676, %677
  %679 = fadd contract float %674, %678
  store float %679, float addrspace(3)* %42, align 4, !tbaa !5
  %680 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %95
  %681 = load float, float addrspace(3)* %680, align 4, !tbaa !5
  %682 = load float, float addrspace(3)* %97, align 4, !tbaa !5
  %683 = fmul contract float %681, %682
  %684 = fadd contract float %679, %683
  store float %684, float addrspace(3)* %42, align 4, !tbaa !5
  %685 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %98
  %686 = load float, float addrspace(3)* %685, align 4, !tbaa !5
  %687 = load float, float addrspace(3)* %100, align 4, !tbaa !5
  %688 = fmul contract float %686, %687
  %689 = fadd contract float %684, %688
  store float %689, float addrspace(3)* %42, align 4, !tbaa !5
  %690 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %101
  %691 = load float, float addrspace(3)* %690, align 4, !tbaa !5
  %692 = load float, float addrspace(3)* %103, align 4, !tbaa !5
  %693 = fmul contract float %691, %692
  %694 = fadd contract float %689, %693
  store float %694, float addrspace(3)* %42, align 4, !tbaa !5
  %695 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %104
  %696 = load float, float addrspace(3)* %695, align 4, !tbaa !5
  %697 = load float, float addrspace(3)* %106, align 4, !tbaa !5
  %698 = fmul contract float %696, %697
  %699 = fadd contract float %694, %698
  store float %699, float addrspace(3)* %42, align 4, !tbaa !5
  %700 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %107
  %701 = load float, float addrspace(3)* %700, align 4, !tbaa !5
  %702 = load float, float addrspace(3)* %109, align 4, !tbaa !5
  %703 = fmul contract float %701, %702
  %704 = fadd contract float %699, %703
  store float %704, float addrspace(3)* %42, align 4, !tbaa !5
  %705 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %110
  %706 = load float, float addrspace(3)* %705, align 4, !tbaa !5
  %707 = load float, float addrspace(3)* %112, align 4, !tbaa !5
  %708 = fmul contract float %706, %707
  %709 = fadd contract float %704, %708
  store float %709, float addrspace(3)* %42, align 4, !tbaa !5
  %710 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %113
  %711 = load float, float addrspace(3)* %710, align 4, !tbaa !5
  %712 = load float, float addrspace(3)* %115, align 4, !tbaa !5
  %713 = fmul contract float %711, %712
  %714 = fadd contract float %709, %713
  store float %714, float addrspace(3)* %42, align 4, !tbaa !5
  %715 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %116
  %716 = load float, float addrspace(3)* %715, align 4, !tbaa !5
  %717 = load float, float addrspace(3)* %118, align 4, !tbaa !5
  %718 = fmul contract float %716, %717
  %719 = fadd contract float %714, %718
  store float %719, float addrspace(3)* %42, align 4, !tbaa !5
  %720 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %119
  %721 = load float, float addrspace(3)* %720, align 4, !tbaa !5
  %722 = load float, float addrspace(3)* %121, align 4, !tbaa !5
  %723 = fmul contract float %721, %722
  %724 = fadd contract float %719, %723
  store float %724, float addrspace(3)* %42, align 4, !tbaa !5
  %725 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %122
  %726 = load float, float addrspace(3)* %725, align 4, !tbaa !5
  %727 = load float, float addrspace(3)* %124, align 4, !tbaa !5
  %728 = fmul contract float %726, %727
  %729 = fadd contract float %724, %728
  store float %729, float addrspace(3)* %42, align 4, !tbaa !5
  %730 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %125
  %731 = load float, float addrspace(3)* %730, align 4, !tbaa !5
  %732 = load float, float addrspace(3)* %127, align 4, !tbaa !5
  %733 = fmul contract float %731, %732
  %734 = fadd contract float %729, %733
  store float %734, float addrspace(3)* %42, align 4, !tbaa !5
  %735 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %128
  %736 = load float, float addrspace(3)* %735, align 4, !tbaa !5
  %737 = load float, float addrspace(3)* %130, align 4, !tbaa !5
  %738 = fmul contract float %736, %737
  %739 = fadd contract float %734, %738
  store float %739, float addrspace(3)* %42, align 4, !tbaa !5
  %740 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %131
  %741 = load float, float addrspace(3)* %740, align 4, !tbaa !5
  %742 = load float, float addrspace(3)* %133, align 4, !tbaa !5
  %743 = fmul contract float %741, %742
  %744 = fadd contract float %739, %743
  store float %744, float addrspace(3)* %42, align 4, !tbaa !5
  %745 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %134
  %746 = load float, float addrspace(3)* %745, align 4, !tbaa !5
  %747 = load float, float addrspace(3)* %136, align 4, !tbaa !5
  %748 = fmul contract float %746, %747
  %749 = fadd contract float %744, %748
  store float %749, float addrspace(3)* %42, align 4, !tbaa !5
  %750 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %137
  %751 = load float, float addrspace(3)* %750, align 4, !tbaa !5
  %752 = load float, float addrspace(3)* %139, align 4, !tbaa !5
  %753 = fmul contract float %751, %752
  %754 = fadd contract float %749, %753
  store float %754, float addrspace(3)* %42, align 4, !tbaa !5
  %755 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %140
  %756 = load float, float addrspace(3)* %755, align 4, !tbaa !5
  %757 = load float, float addrspace(3)* %142, align 4, !tbaa !5
  %758 = fmul contract float %756, %757
  %759 = fadd contract float %754, %758
  store float %759, float addrspace(3)* %42, align 4, !tbaa !5
  %760 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %143
  %761 = load float, float addrspace(3)* %760, align 4, !tbaa !5
  %762 = load float, float addrspace(3)* %145, align 4, !tbaa !5
  %763 = fmul contract float %761, %762
  %764 = fadd contract float %759, %763
  store float %764, float addrspace(3)* %42, align 4, !tbaa !5
  %765 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %146
  %766 = load float, float addrspace(3)* %765, align 4, !tbaa !5
  %767 = load float, float addrspace(3)* %148, align 4, !tbaa !5
  %768 = fmul contract float %766, %767
  %769 = fadd contract float %764, %768
  store float %769, float addrspace(3)* %42, align 4, !tbaa !5
  %770 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %149
  %771 = load float, float addrspace(3)* %770, align 4, !tbaa !5
  %772 = load float, float addrspace(3)* %151, align 4, !tbaa !5
  %773 = fmul contract float %771, %772
  %774 = fadd contract float %769, %773
  store float %774, float addrspace(3)* %42, align 4, !tbaa !5
  %775 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %152
  %776 = load float, float addrspace(3)* %775, align 4, !tbaa !5
  %777 = load float, float addrspace(3)* %154, align 4, !tbaa !5
  %778 = fmul contract float %776, %777
  %779 = fadd contract float %774, %778
  store float %779, float addrspace(3)* %42, align 4, !tbaa !5
  %780 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %155
  %781 = load float, float addrspace(3)* %780, align 4, !tbaa !5
  %782 = load float, float addrspace(3)* %157, align 4, !tbaa !5
  %783 = fmul contract float %781, %782
  %784 = fadd contract float %779, %783
  store float %784, float addrspace(3)* %42, align 4, !tbaa !5
  %785 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %158
  %786 = load float, float addrspace(3)* %785, align 4, !tbaa !5
  %787 = load float, float addrspace(3)* %160, align 4, !tbaa !5
  %788 = fmul contract float %786, %787
  %789 = fadd contract float %784, %788
  store float %789, float addrspace(3)* %42, align 4, !tbaa !5
  %790 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %161
  %791 = load float, float addrspace(3)* %790, align 4, !tbaa !5
  %792 = load float, float addrspace(3)* %163, align 4, !tbaa !5
  %793 = fmul contract float %791, %792
  %794 = fadd contract float %789, %793
  store float %794, float addrspace(3)* %42, align 4, !tbaa !5
  %795 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %164
  %796 = load float, float addrspace(3)* %795, align 4, !tbaa !5
  %797 = load float, float addrspace(3)* %166, align 4, !tbaa !5
  %798 = fmul contract float %796, %797
  %799 = fadd contract float %794, %798
  store float %799, float addrspace(3)* %42, align 4, !tbaa !5
  %800 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %167
  %801 = load float, float addrspace(3)* %800, align 4, !tbaa !5
  %802 = load float, float addrspace(3)* %169, align 4, !tbaa !5
  %803 = fmul contract float %801, %802
  %804 = fadd contract float %799, %803
  store float %804, float addrspace(3)* %42, align 4, !tbaa !5
  %805 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %170
  %806 = load float, float addrspace(3)* %805, align 4, !tbaa !5
  %807 = load float, float addrspace(3)* %172, align 4, !tbaa !5
  %808 = fmul contract float %806, %807
  %809 = fadd contract float %804, %808
  store float %809, float addrspace(3)* %42, align 4, !tbaa !5
  %810 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %173
  %811 = load float, float addrspace(3)* %810, align 4, !tbaa !5
  %812 = load float, float addrspace(3)* %175, align 4, !tbaa !5
  %813 = fmul contract float %811, %812
  %814 = fadd contract float %809, %813
  store float %814, float addrspace(3)* %42, align 4, !tbaa !5
  %815 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %176
  %816 = load float, float addrspace(3)* %815, align 4, !tbaa !5
  %817 = load float, float addrspace(3)* %178, align 4, !tbaa !5
  %818 = fmul contract float %816, %817
  %819 = fadd contract float %814, %818
  store float %819, float addrspace(3)* %42, align 4, !tbaa !5
  %820 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %179
  %821 = load float, float addrspace(3)* %820, align 4, !tbaa !5
  %822 = load float, float addrspace(3)* %181, align 4, !tbaa !5
  %823 = fmul contract float %821, %822
  %824 = fadd contract float %819, %823
  store float %824, float addrspace(3)* %42, align 4, !tbaa !5
  %825 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %182
  %826 = load float, float addrspace(3)* %825, align 4, !tbaa !5
  %827 = load float, float addrspace(3)* %184, align 4, !tbaa !5
  %828 = fmul contract float %826, %827
  %829 = fadd contract float %824, %828
  store float %829, float addrspace(3)* %42, align 4, !tbaa !5
  %830 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %185
  %831 = load float, float addrspace(3)* %830, align 4, !tbaa !5
  %832 = load float, float addrspace(3)* %187, align 4, !tbaa !5
  %833 = fmul contract float %831, %832
  %834 = fadd contract float %829, %833
  store float %834, float addrspace(3)* %42, align 4, !tbaa !5
  %835 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %188
  %836 = load float, float addrspace(3)* %835, align 4, !tbaa !5
  %837 = load float, float addrspace(3)* %190, align 4, !tbaa !5
  %838 = fmul contract float %836, %837
  %839 = fadd contract float %834, %838
  store float %839, float addrspace(3)* %42, align 4, !tbaa !5
  %840 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %191
  %841 = load float, float addrspace(3)* %840, align 4, !tbaa !5
  %842 = load float, float addrspace(3)* %193, align 4, !tbaa !5
  %843 = fmul contract float %841, %842
  %844 = fadd contract float %839, %843
  store float %844, float addrspace(3)* %42, align 4, !tbaa !5
  %845 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %194
  %846 = load float, float addrspace(3)* %845, align 4, !tbaa !5
  %847 = load float, float addrspace(3)* %196, align 4, !tbaa !5
  %848 = fmul contract float %846, %847
  %849 = fadd contract float %844, %848
  store float %849, float addrspace(3)* %42, align 4, !tbaa !5
  %850 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %197
  %851 = load float, float addrspace(3)* %850, align 4, !tbaa !5
  %852 = load float, float addrspace(3)* %199, align 4, !tbaa !5
  %853 = fmul contract float %851, %852
  %854 = fadd contract float %849, %853
  store float %854, float addrspace(3)* %42, align 4, !tbaa !5
  %855 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %200
  %856 = load float, float addrspace(3)* %855, align 4, !tbaa !5
  %857 = load float, float addrspace(3)* %202, align 4, !tbaa !5
  %858 = fmul contract float %856, %857
  %859 = fadd contract float %854, %858
  store float %859, float addrspace(3)* %42, align 4, !tbaa !5
  %860 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %203
  %861 = load float, float addrspace(3)* %860, align 4, !tbaa !5
  %862 = load float, float addrspace(3)* %205, align 4, !tbaa !5
  %863 = fmul contract float %861, %862
  %864 = fadd contract float %859, %863
  store float %864, float addrspace(3)* %42, align 4, !tbaa !5
  %865 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %206
  %866 = load float, float addrspace(3)* %865, align 4, !tbaa !5
  %867 = load float, float addrspace(3)* %208, align 4, !tbaa !5
  %868 = fmul contract float %866, %867
  %869 = fadd contract float %864, %868
  store float %869, float addrspace(3)* %42, align 4, !tbaa !5
  %870 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %209
  %871 = load float, float addrspace(3)* %870, align 4, !tbaa !5
  %872 = load float, float addrspace(3)* %211, align 4, !tbaa !5
  %873 = fmul contract float %871, %872
  %874 = fadd contract float %869, %873
  store float %874, float addrspace(3)* %42, align 4, !tbaa !5
  %875 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %212
  %876 = load float, float addrspace(3)* %875, align 4, !tbaa !5
  %877 = load float, float addrspace(3)* %214, align 4, !tbaa !5
  %878 = fmul contract float %876, %877
  %879 = fadd contract float %874, %878
  store float %879, float addrspace(3)* %42, align 4, !tbaa !5
  %880 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %215
  %881 = load float, float addrspace(3)* %880, align 4, !tbaa !5
  %882 = load float, float addrspace(3)* %217, align 4, !tbaa !5
  %883 = fmul contract float %881, %882
  %884 = fadd contract float %879, %883
  store float %884, float addrspace(3)* %42, align 4, !tbaa !5
  %885 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %218
  %886 = load float, float addrspace(3)* %885, align 4, !tbaa !5
  %887 = load float, float addrspace(3)* %220, align 4, !tbaa !5
  %888 = fmul contract float %886, %887
  %889 = fadd contract float %884, %888
  store float %889, float addrspace(3)* %42, align 4, !tbaa !5
  %890 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %221
  %891 = load float, float addrspace(3)* %890, align 4, !tbaa !5
  %892 = load float, float addrspace(3)* %223, align 4, !tbaa !5
  %893 = fmul contract float %891, %892
  %894 = fadd contract float %889, %893
  store float %894, float addrspace(3)* %42, align 4, !tbaa !5
  %895 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %224
  %896 = load float, float addrspace(3)* %895, align 4, !tbaa !5
  %897 = load float, float addrspace(3)* %226, align 4, !tbaa !5
  %898 = fmul contract float %896, %897
  %899 = fadd contract float %894, %898
  store float %899, float addrspace(3)* %42, align 4, !tbaa !5
  %900 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %227
  %901 = load float, float addrspace(3)* %900, align 4, !tbaa !5
  %902 = load float, float addrspace(3)* %229, align 4, !tbaa !5
  %903 = fmul contract float %901, %902
  %904 = fadd contract float %899, %903
  store float %904, float addrspace(3)* %42, align 4, !tbaa !5
  %905 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %230
  %906 = load float, float addrspace(3)* %905, align 4, !tbaa !5
  %907 = load float, float addrspace(3)* %232, align 4, !tbaa !5
  %908 = fmul contract float %906, %907
  %909 = fadd contract float %904, %908
  store float %909, float addrspace(3)* %42, align 4, !tbaa !5
  %910 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %233
  %911 = load float, float addrspace(3)* %910, align 4, !tbaa !5
  %912 = load float, float addrspace(3)* %235, align 4, !tbaa !5
  %913 = fmul contract float %911, %912
  %914 = fadd contract float %909, %913
  store float %914, float addrspace(3)* %42, align 4, !tbaa !5
  %915 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %236
  %916 = load float, float addrspace(3)* %915, align 4, !tbaa !5
  %917 = load float, float addrspace(3)* %238, align 4, !tbaa !5
  %918 = fmul contract float %916, %917
  %919 = fadd contract float %914, %918
  store float %919, float addrspace(3)* %42, align 4, !tbaa !5
  %920 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %239
  %921 = load float, float addrspace(3)* %920, align 4, !tbaa !5
  %922 = load float, float addrspace(3)* %241, align 4, !tbaa !5
  %923 = fmul contract float %921, %922
  %924 = fadd contract float %919, %923
  store float %924, float addrspace(3)* %42, align 4, !tbaa !5
  %925 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %242
  %926 = load float, float addrspace(3)* %925, align 4, !tbaa !5
  %927 = load float, float addrspace(3)* %244, align 4, !tbaa !5
  %928 = fmul contract float %926, %927
  %929 = fadd contract float %924, %928
  store float %929, float addrspace(3)* %42, align 4, !tbaa !5
  %930 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %245
  %931 = load float, float addrspace(3)* %930, align 4, !tbaa !5
  %932 = load float, float addrspace(3)* %247, align 4, !tbaa !5
  %933 = fmul contract float %931, %932
  %934 = fadd contract float %929, %933
  store float %934, float addrspace(3)* %42, align 4, !tbaa !5
  %935 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %248
  %936 = load float, float addrspace(3)* %935, align 4, !tbaa !5
  %937 = load float, float addrspace(3)* %250, align 4, !tbaa !5
  %938 = fmul contract float %936, %937
  %939 = fadd contract float %934, %938
  store float %939, float addrspace(3)* %42, align 4, !tbaa !5
  %940 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %251
  %941 = load float, float addrspace(3)* %940, align 4, !tbaa !5
  %942 = load float, float addrspace(3)* %253, align 4, !tbaa !5
  %943 = fmul contract float %941, %942
  %944 = fadd contract float %939, %943
  store float %944, float addrspace(3)* %42, align 4, !tbaa !5
  %945 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %254
  %946 = load float, float addrspace(3)* %945, align 4, !tbaa !5
  %947 = load float, float addrspace(3)* %256, align 4, !tbaa !5
  %948 = fmul contract float %946, %947
  %949 = fadd contract float %944, %948
  store float %949, float addrspace(3)* %42, align 4, !tbaa !5
  %950 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %257
  %951 = load float, float addrspace(3)* %950, align 4, !tbaa !5
  %952 = load float, float addrspace(3)* %259, align 4, !tbaa !5
  %953 = fmul contract float %951, %952
  %954 = fadd contract float %949, %953
  store float %954, float addrspace(3)* %42, align 4, !tbaa !5
  %955 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %260
  %956 = load float, float addrspace(3)* %955, align 4, !tbaa !5
  %957 = load float, float addrspace(3)* %262, align 4, !tbaa !5
  %958 = fmul contract float %956, %957
  %959 = fadd contract float %954, %958
  store float %959, float addrspace(3)* %42, align 4, !tbaa !5
  %960 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %263
  %961 = load float, float addrspace(3)* %960, align 4, !tbaa !5
  %962 = load float, float addrspace(3)* %265, align 4, !tbaa !5
  %963 = fmul contract float %961, %962
  %964 = fadd contract float %959, %963
  store float %964, float addrspace(3)* %42, align 4, !tbaa !5
  %965 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %266
  %966 = load float, float addrspace(3)* %965, align 4, !tbaa !5
  %967 = load float, float addrspace(3)* %268, align 4, !tbaa !5
  %968 = fmul contract float %966, %967
  %969 = fadd contract float %964, %968
  store float %969, float addrspace(3)* %42, align 4, !tbaa !5
  %970 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %269
  %971 = load float, float addrspace(3)* %970, align 4, !tbaa !5
  %972 = load float, float addrspace(3)* %271, align 4, !tbaa !5
  %973 = fmul contract float %971, %972
  %974 = fadd contract float %969, %973
  store float %974, float addrspace(3)* %42, align 4, !tbaa !5
  %975 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %272
  %976 = load float, float addrspace(3)* %975, align 4, !tbaa !5
  %977 = load float, float addrspace(3)* %274, align 4, !tbaa !5
  %978 = fmul contract float %976, %977
  %979 = fadd contract float %974, %978
  store float %979, float addrspace(3)* %42, align 4, !tbaa !5
  %980 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %275
  %981 = load float, float addrspace(3)* %980, align 4, !tbaa !5
  %982 = load float, float addrspace(3)* %277, align 4, !tbaa !5
  %983 = fmul contract float %981, %982
  %984 = fadd contract float %979, %983
  store float %984, float addrspace(3)* %42, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %985 = getelementptr inbounds float, float addrspace(1)* %1, i64 16384
  %986 = getelementptr inbounds float, float addrspace(1)* %985, i64 %44
  %987 = load float, float addrspace(1)* %986, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %987, float addrspace(3)* %45, align 4, !tbaa !5
  %988 = getelementptr inbounds float, float addrspace(1)* %985, i64 %46
  %989 = load float, float addrspace(1)* %988, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %989, float addrspace(3)* %47, align 4, !tbaa !5
  %990 = getelementptr inbounds float, float addrspace(1)* %985, i64 %48
  %991 = load float, float addrspace(1)* %990, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %991, float addrspace(3)* %49, align 4, !tbaa !5
  %992 = getelementptr inbounds float, float addrspace(1)* %985, i64 %50
  %993 = load float, float addrspace(1)* %992, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %993, float addrspace(3)* %51, align 4, !tbaa !5
  %994 = getelementptr inbounds float, float addrspace(1)* %985, i64 %53
  %995 = load float, float addrspace(1)* %994, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %995, float addrspace(3)* %54, align 4, !tbaa !5
  %996 = getelementptr inbounds float, float addrspace(1)* %985, i64 %56
  %997 = load float, float addrspace(1)* %996, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %997, float addrspace(3)* %57, align 4, !tbaa !5
  %998 = getelementptr inbounds float, float addrspace(1)* %985, i64 %59
  %999 = load float, float addrspace(1)* %998, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %999, float addrspace(3)* %60, align 4, !tbaa !5
  %1000 = getelementptr inbounds float, float addrspace(1)* %985, i64 %62
  %1001 = load float, float addrspace(1)* %1000, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %1001, float addrspace(3)* %63, align 4, !tbaa !5
  %1002 = getelementptr inbounds float, float addrspace(1)* %985, i64 %65
  %1003 = load float, float addrspace(1)* %1002, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %1003, float addrspace(3)* %66, align 4, !tbaa !5
  %1004 = getelementptr inbounds float, float addrspace(1)* %985, i64 %68
  %1005 = load float, float addrspace(1)* %1004, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %1005, float addrspace(3)* %69, align 4, !tbaa !5
  %1006 = getelementptr inbounds float, float addrspace(1)* %985, i64 %71
  %1007 = load float, float addrspace(1)* %1006, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %1007, float addrspace(3)* %72, align 4, !tbaa !5
  %1008 = getelementptr inbounds float, float addrspace(1)* %985, i64 %74
  %1009 = load float, float addrspace(1)* %1008, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %1009, float addrspace(3)* %75, align 4, !tbaa !5
  %1010 = getelementptr inbounds float, float addrspace(1)* %985, i64 %77
  %1011 = load float, float addrspace(1)* %1010, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %1011, float addrspace(3)* %78, align 4, !tbaa !5
  %1012 = getelementptr inbounds float, float addrspace(1)* %985, i64 %80
  %1013 = load float, float addrspace(1)* %1012, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %1013, float addrspace(3)* %81, align 4, !tbaa !5
  %1014 = getelementptr inbounds float, float addrspace(1)* %985, i64 %83
  %1015 = load float, float addrspace(1)* %1014, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %1015, float addrspace(3)* %84, align 4, !tbaa !5
  %1016 = getelementptr inbounds float, float addrspace(1)* %985, i64 %86
  %1017 = load float, float addrspace(1)* %1016, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %1017, float addrspace(3)* %87, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %1018 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 128), i32 %43
  %1019 = load float, float addrspace(3)* %1018, align 4, !tbaa !5
  %1020 = load float, float addrspace(3)* %88, align 4, !tbaa !5
  %1021 = fmul contract float %1019, %1020
  %1022 = load float, float addrspace(3)* %42, align 4, !tbaa !5
  %1023 = fadd contract float %1022, %1021
  store float %1023, float addrspace(3)* %42, align 4, !tbaa !5
  %1024 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 128), i32 %89
  %1025 = load float, float addrspace(3)* %1024, align 4, !tbaa !5
  %1026 = load float, float addrspace(3)* %91, align 4, !tbaa !5
  %1027 = fmul contract float %1025, %1026
  %1028 = fadd contract float %1023, %1027
  store float %1028, float addrspace(3)* %42, align 4, !tbaa !5
  %1029 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 128), i32 %92
  %1030 = load float, float addrspace(3)* %1029, align 4, !tbaa !5
  %1031 = load float, float addrspace(3)* %94, align 4, !tbaa !5
  %1032 = fmul contract float %1030, %1031
  %1033 = fadd contract float %1028, %1032
  store float %1033, float addrspace(3)* %42, align 4, !tbaa !5
  %1034 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 128), i32 %95
  %1035 = load float, float addrspace(3)* %1034, align 4, !tbaa !5
  %1036 = load float, float addrspace(3)* %97, align 4, !tbaa !5
  %1037 = fmul contract float %1035, %1036
  %1038 = fadd contract float %1033, %1037
  store float %1038, float addrspace(3)* %42, align 4, !tbaa !5
  %1039 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 128), i32 %98
  %1040 = load float, float addrspace(3)* %1039, align 4, !tbaa !5
  %1041 = load float, float addrspace(3)* %100, align 4, !tbaa !5
  %1042 = fmul contract float %1040, %1041
  %1043 = fadd contract float %1038, %1042
  store float %1043, float addrspace(3)* %42, align 4, !tbaa !5
  %1044 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 128), i32 %101
  %1045 = load float, float addrspace(3)* %1044, align 4, !tbaa !5
  %1046 = load float, float addrspace(3)* %103, align 4, !tbaa !5
  %1047 = fmul contract float %1045, %1046
  %1048 = fadd contract float %1043, %1047
  store float %1048, float addrspace(3)* %42, align 4, !tbaa !5
  %1049 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 128), i32 %104
  %1050 = load float, float addrspace(3)* %1049, align 4, !tbaa !5
  %1051 = load float, float addrspace(3)* %106, align 4, !tbaa !5
  %1052 = fmul contract float %1050, %1051
  %1053 = fadd contract float %1048, %1052
  store float %1053, float addrspace(3)* %42, align 4, !tbaa !5
  %1054 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 128), i32 %107
  %1055 = load float, float addrspace(3)* %1054, align 4, !tbaa !5
  %1056 = load float, float addrspace(3)* %109, align 4, !tbaa !5
  %1057 = fmul contract float %1055, %1056
  %1058 = fadd contract float %1053, %1057
  store float %1058, float addrspace(3)* %42, align 4, !tbaa !5
  %1059 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 128), i32 %110
  %1060 = load float, float addrspace(3)* %1059, align 4, !tbaa !5
  %1061 = load float, float addrspace(3)* %112, align 4, !tbaa !5
  %1062 = fmul contract float %1060, %1061
  %1063 = fadd contract float %1058, %1062
  store float %1063, float addrspace(3)* %42, align 4, !tbaa !5
  %1064 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 128), i32 %113
  %1065 = load float, float addrspace(3)* %1064, align 4, !tbaa !5
  %1066 = load float, float addrspace(3)* %115, align 4, !tbaa !5
  %1067 = fmul contract float %1065, %1066
  %1068 = fadd contract float %1063, %1067
  store float %1068, float addrspace(3)* %42, align 4, !tbaa !5
  %1069 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 128), i32 %116
  %1070 = load float, float addrspace(3)* %1069, align 4, !tbaa !5
  %1071 = load float, float addrspace(3)* %118, align 4, !tbaa !5
  %1072 = fmul contract float %1070, %1071
  %1073 = fadd contract float %1068, %1072
  store float %1073, float addrspace(3)* %42, align 4, !tbaa !5
  %1074 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 128), i32 %119
  %1075 = load float, float addrspace(3)* %1074, align 4, !tbaa !5
  %1076 = load float, float addrspace(3)* %121, align 4, !tbaa !5
  %1077 = fmul contract float %1075, %1076
  %1078 = fadd contract float %1073, %1077
  store float %1078, float addrspace(3)* %42, align 4, !tbaa !5
  %1079 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 128), i32 %122
  %1080 = load float, float addrspace(3)* %1079, align 4, !tbaa !5
  %1081 = load float, float addrspace(3)* %124, align 4, !tbaa !5
  %1082 = fmul contract float %1080, %1081
  %1083 = fadd contract float %1078, %1082
  store float %1083, float addrspace(3)* %42, align 4, !tbaa !5
  %1084 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 128), i32 %125
  %1085 = load float, float addrspace(3)* %1084, align 4, !tbaa !5
  %1086 = load float, float addrspace(3)* %127, align 4, !tbaa !5
  %1087 = fmul contract float %1085, %1086
  %1088 = fadd contract float %1083, %1087
  store float %1088, float addrspace(3)* %42, align 4, !tbaa !5
  %1089 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 128), i32 %128
  %1090 = load float, float addrspace(3)* %1089, align 4, !tbaa !5
  %1091 = load float, float addrspace(3)* %130, align 4, !tbaa !5
  %1092 = fmul contract float %1090, %1091
  %1093 = fadd contract float %1088, %1092
  store float %1093, float addrspace(3)* %42, align 4, !tbaa !5
  %1094 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 128), i32 %131
  %1095 = load float, float addrspace(3)* %1094, align 4, !tbaa !5
  %1096 = load float, float addrspace(3)* %133, align 4, !tbaa !5
  %1097 = fmul contract float %1095, %1096
  %1098 = fadd contract float %1093, %1097
  store float %1098, float addrspace(3)* %42, align 4, !tbaa !5
  %1099 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 128), i32 %134
  %1100 = load float, float addrspace(3)* %1099, align 4, !tbaa !5
  %1101 = load float, float addrspace(3)* %136, align 4, !tbaa !5
  %1102 = fmul contract float %1100, %1101
  %1103 = fadd contract float %1098, %1102
  store float %1103, float addrspace(3)* %42, align 4, !tbaa !5
  %1104 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 128), i32 %137
  %1105 = load float, float addrspace(3)* %1104, align 4, !tbaa !5
  %1106 = load float, float addrspace(3)* %139, align 4, !tbaa !5
  %1107 = fmul contract float %1105, %1106
  %1108 = fadd contract float %1103, %1107
  store float %1108, float addrspace(3)* %42, align 4, !tbaa !5
  %1109 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 128), i32 %140
  %1110 = load float, float addrspace(3)* %1109, align 4, !tbaa !5
  %1111 = load float, float addrspace(3)* %142, align 4, !tbaa !5
  %1112 = fmul contract float %1110, %1111
  %1113 = fadd contract float %1108, %1112
  store float %1113, float addrspace(3)* %42, align 4, !tbaa !5
  %1114 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 128), i32 %143
  %1115 = load float, float addrspace(3)* %1114, align 4, !tbaa !5
  %1116 = load float, float addrspace(3)* %145, align 4, !tbaa !5
  %1117 = fmul contract float %1115, %1116
  %1118 = fadd contract float %1113, %1117
  store float %1118, float addrspace(3)* %42, align 4, !tbaa !5
  %1119 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 128), i32 %146
  %1120 = load float, float addrspace(3)* %1119, align 4, !tbaa !5
  %1121 = load float, float addrspace(3)* %148, align 4, !tbaa !5
  %1122 = fmul contract float %1120, %1121
  %1123 = fadd contract float %1118, %1122
  store float %1123, float addrspace(3)* %42, align 4, !tbaa !5
  %1124 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 128), i32 %149
  %1125 = load float, float addrspace(3)* %1124, align 4, !tbaa !5
  %1126 = load float, float addrspace(3)* %151, align 4, !tbaa !5
  %1127 = fmul contract float %1125, %1126
  %1128 = fadd contract float %1123, %1127
  store float %1128, float addrspace(3)* %42, align 4, !tbaa !5
  %1129 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 128), i32 %152
  %1130 = load float, float addrspace(3)* %1129, align 4, !tbaa !5
  %1131 = load float, float addrspace(3)* %154, align 4, !tbaa !5
  %1132 = fmul contract float %1130, %1131
  %1133 = fadd contract float %1128, %1132
  store float %1133, float addrspace(3)* %42, align 4, !tbaa !5
  %1134 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 128), i32 %155
  %1135 = load float, float addrspace(3)* %1134, align 4, !tbaa !5
  %1136 = load float, float addrspace(3)* %157, align 4, !tbaa !5
  %1137 = fmul contract float %1135, %1136
  %1138 = fadd contract float %1133, %1137
  store float %1138, float addrspace(3)* %42, align 4, !tbaa !5
  %1139 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 128), i32 %158
  %1140 = load float, float addrspace(3)* %1139, align 4, !tbaa !5
  %1141 = load float, float addrspace(3)* %160, align 4, !tbaa !5
  %1142 = fmul contract float %1140, %1141
  %1143 = fadd contract float %1138, %1142
  store float %1143, float addrspace(3)* %42, align 4, !tbaa !5
  %1144 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 128), i32 %161
  %1145 = load float, float addrspace(3)* %1144, align 4, !tbaa !5
  %1146 = load float, float addrspace(3)* %163, align 4, !tbaa !5
  %1147 = fmul contract float %1145, %1146
  %1148 = fadd contract float %1143, %1147
  store float %1148, float addrspace(3)* %42, align 4, !tbaa !5
  %1149 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 128), i32 %164
  %1150 = load float, float addrspace(3)* %1149, align 4, !tbaa !5
  %1151 = load float, float addrspace(3)* %166, align 4, !tbaa !5
  %1152 = fmul contract float %1150, %1151
  %1153 = fadd contract float %1148, %1152
  store float %1153, float addrspace(3)* %42, align 4, !tbaa !5
  %1154 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 128), i32 %167
  %1155 = load float, float addrspace(3)* %1154, align 4, !tbaa !5
  %1156 = load float, float addrspace(3)* %169, align 4, !tbaa !5
  %1157 = fmul contract float %1155, %1156
  %1158 = fadd contract float %1153, %1157
  store float %1158, float addrspace(3)* %42, align 4, !tbaa !5
  %1159 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 128), i32 %170
  %1160 = load float, float addrspace(3)* %1159, align 4, !tbaa !5
  %1161 = load float, float addrspace(3)* %172, align 4, !tbaa !5
  %1162 = fmul contract float %1160, %1161
  %1163 = fadd contract float %1158, %1162
  store float %1163, float addrspace(3)* %42, align 4, !tbaa !5
  %1164 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 128), i32 %173
  %1165 = load float, float addrspace(3)* %1164, align 4, !tbaa !5
  %1166 = load float, float addrspace(3)* %175, align 4, !tbaa !5
  %1167 = fmul contract float %1165, %1166
  %1168 = fadd contract float %1163, %1167
  store float %1168, float addrspace(3)* %42, align 4, !tbaa !5
  %1169 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 128), i32 %176
  %1170 = load float, float addrspace(3)* %1169, align 4, !tbaa !5
  %1171 = load float, float addrspace(3)* %178, align 4, !tbaa !5
  %1172 = fmul contract float %1170, %1171
  %1173 = fadd contract float %1168, %1172
  store float %1173, float addrspace(3)* %42, align 4, !tbaa !5
  %1174 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 128), i32 %179
  %1175 = load float, float addrspace(3)* %1174, align 4, !tbaa !5
  %1176 = load float, float addrspace(3)* %181, align 4, !tbaa !5
  %1177 = fmul contract float %1175, %1176
  %1178 = fadd contract float %1173, %1177
  store float %1178, float addrspace(3)* %42, align 4, !tbaa !5
  %1179 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 128), i32 %182
  %1180 = load float, float addrspace(3)* %1179, align 4, !tbaa !5
  %1181 = load float, float addrspace(3)* %184, align 4, !tbaa !5
  %1182 = fmul contract float %1180, %1181
  %1183 = fadd contract float %1178, %1182
  store float %1183, float addrspace(3)* %42, align 4, !tbaa !5
  %1184 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 128), i32 %185
  %1185 = load float, float addrspace(3)* %1184, align 4, !tbaa !5
  %1186 = load float, float addrspace(3)* %187, align 4, !tbaa !5
  %1187 = fmul contract float %1185, %1186
  %1188 = fadd contract float %1183, %1187
  store float %1188, float addrspace(3)* %42, align 4, !tbaa !5
  %1189 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 128), i32 %188
  %1190 = load float, float addrspace(3)* %1189, align 4, !tbaa !5
  %1191 = load float, float addrspace(3)* %190, align 4, !tbaa !5
  %1192 = fmul contract float %1190, %1191
  %1193 = fadd contract float %1188, %1192
  store float %1193, float addrspace(3)* %42, align 4, !tbaa !5
  %1194 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 128), i32 %191
  %1195 = load float, float addrspace(3)* %1194, align 4, !tbaa !5
  %1196 = load float, float addrspace(3)* %193, align 4, !tbaa !5
  %1197 = fmul contract float %1195, %1196
  %1198 = fadd contract float %1193, %1197
  store float %1198, float addrspace(3)* %42, align 4, !tbaa !5
  %1199 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 128), i32 %194
  %1200 = load float, float addrspace(3)* %1199, align 4, !tbaa !5
  %1201 = load float, float addrspace(3)* %196, align 4, !tbaa !5
  %1202 = fmul contract float %1200, %1201
  %1203 = fadd contract float %1198, %1202
  store float %1203, float addrspace(3)* %42, align 4, !tbaa !5
  %1204 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 128), i32 %197
  %1205 = load float, float addrspace(3)* %1204, align 4, !tbaa !5
  %1206 = load float, float addrspace(3)* %199, align 4, !tbaa !5
  %1207 = fmul contract float %1205, %1206
  %1208 = fadd contract float %1203, %1207
  store float %1208, float addrspace(3)* %42, align 4, !tbaa !5
  %1209 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 128), i32 %200
  %1210 = load float, float addrspace(3)* %1209, align 4, !tbaa !5
  %1211 = load float, float addrspace(3)* %202, align 4, !tbaa !5
  %1212 = fmul contract float %1210, %1211
  %1213 = fadd contract float %1208, %1212
  store float %1213, float addrspace(3)* %42, align 4, !tbaa !5
  %1214 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 128), i32 %203
  %1215 = load float, float addrspace(3)* %1214, align 4, !tbaa !5
  %1216 = load float, float addrspace(3)* %205, align 4, !tbaa !5
  %1217 = fmul contract float %1215, %1216
  %1218 = fadd contract float %1213, %1217
  store float %1218, float addrspace(3)* %42, align 4, !tbaa !5
  %1219 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 128), i32 %206
  %1220 = load float, float addrspace(3)* %1219, align 4, !tbaa !5
  %1221 = load float, float addrspace(3)* %208, align 4, !tbaa !5
  %1222 = fmul contract float %1220, %1221
  %1223 = fadd contract float %1218, %1222
  store float %1223, float addrspace(3)* %42, align 4, !tbaa !5
  %1224 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 128), i32 %209
  %1225 = load float, float addrspace(3)* %1224, align 4, !tbaa !5
  %1226 = load float, float addrspace(3)* %211, align 4, !tbaa !5
  %1227 = fmul contract float %1225, %1226
  %1228 = fadd contract float %1223, %1227
  store float %1228, float addrspace(3)* %42, align 4, !tbaa !5
  %1229 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 128), i32 %212
  %1230 = load float, float addrspace(3)* %1229, align 4, !tbaa !5
  %1231 = load float, float addrspace(3)* %214, align 4, !tbaa !5
  %1232 = fmul contract float %1230, %1231
  %1233 = fadd contract float %1228, %1232
  store float %1233, float addrspace(3)* %42, align 4, !tbaa !5
  %1234 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 128), i32 %215
  %1235 = load float, float addrspace(3)* %1234, align 4, !tbaa !5
  %1236 = load float, float addrspace(3)* %217, align 4, !tbaa !5
  %1237 = fmul contract float %1235, %1236
  %1238 = fadd contract float %1233, %1237
  store float %1238, float addrspace(3)* %42, align 4, !tbaa !5
  %1239 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 128), i32 %218
  %1240 = load float, float addrspace(3)* %1239, align 4, !tbaa !5
  %1241 = load float, float addrspace(3)* %220, align 4, !tbaa !5
  %1242 = fmul contract float %1240, %1241
  %1243 = fadd contract float %1238, %1242
  store float %1243, float addrspace(3)* %42, align 4, !tbaa !5
  %1244 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 128), i32 %221
  %1245 = load float, float addrspace(3)* %1244, align 4, !tbaa !5
  %1246 = load float, float addrspace(3)* %223, align 4, !tbaa !5
  %1247 = fmul contract float %1245, %1246
  %1248 = fadd contract float %1243, %1247
  store float %1248, float addrspace(3)* %42, align 4, !tbaa !5
  %1249 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 128), i32 %224
  %1250 = load float, float addrspace(3)* %1249, align 4, !tbaa !5
  %1251 = load float, float addrspace(3)* %226, align 4, !tbaa !5
  %1252 = fmul contract float %1250, %1251
  %1253 = fadd contract float %1248, %1252
  store float %1253, float addrspace(3)* %42, align 4, !tbaa !5
  %1254 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 128), i32 %227
  %1255 = load float, float addrspace(3)* %1254, align 4, !tbaa !5
  %1256 = load float, float addrspace(3)* %229, align 4, !tbaa !5
  %1257 = fmul contract float %1255, %1256
  %1258 = fadd contract float %1253, %1257
  store float %1258, float addrspace(3)* %42, align 4, !tbaa !5
  %1259 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 128), i32 %230
  %1260 = load float, float addrspace(3)* %1259, align 4, !tbaa !5
  %1261 = load float, float addrspace(3)* %232, align 4, !tbaa !5
  %1262 = fmul contract float %1260, %1261
  %1263 = fadd contract float %1258, %1262
  store float %1263, float addrspace(3)* %42, align 4, !tbaa !5
  %1264 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 128), i32 %233
  %1265 = load float, float addrspace(3)* %1264, align 4, !tbaa !5
  %1266 = load float, float addrspace(3)* %235, align 4, !tbaa !5
  %1267 = fmul contract float %1265, %1266
  %1268 = fadd contract float %1263, %1267
  store float %1268, float addrspace(3)* %42, align 4, !tbaa !5
  %1269 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 128), i32 %236
  %1270 = load float, float addrspace(3)* %1269, align 4, !tbaa !5
  %1271 = load float, float addrspace(3)* %238, align 4, !tbaa !5
  %1272 = fmul contract float %1270, %1271
  %1273 = fadd contract float %1268, %1272
  store float %1273, float addrspace(3)* %42, align 4, !tbaa !5
  %1274 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 128), i32 %239
  %1275 = load float, float addrspace(3)* %1274, align 4, !tbaa !5
  %1276 = load float, float addrspace(3)* %241, align 4, !tbaa !5
  %1277 = fmul contract float %1275, %1276
  %1278 = fadd contract float %1273, %1277
  store float %1278, float addrspace(3)* %42, align 4, !tbaa !5
  %1279 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 128), i32 %242
  %1280 = load float, float addrspace(3)* %1279, align 4, !tbaa !5
  %1281 = load float, float addrspace(3)* %244, align 4, !tbaa !5
  %1282 = fmul contract float %1280, %1281
  %1283 = fadd contract float %1278, %1282
  store float %1283, float addrspace(3)* %42, align 4, !tbaa !5
  %1284 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 128), i32 %245
  %1285 = load float, float addrspace(3)* %1284, align 4, !tbaa !5
  %1286 = load float, float addrspace(3)* %247, align 4, !tbaa !5
  %1287 = fmul contract float %1285, %1286
  %1288 = fadd contract float %1283, %1287
  store float %1288, float addrspace(3)* %42, align 4, !tbaa !5
  %1289 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 128), i32 %248
  %1290 = load float, float addrspace(3)* %1289, align 4, !tbaa !5
  %1291 = load float, float addrspace(3)* %250, align 4, !tbaa !5
  %1292 = fmul contract float %1290, %1291
  %1293 = fadd contract float %1288, %1292
  store float %1293, float addrspace(3)* %42, align 4, !tbaa !5
  %1294 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 128), i32 %251
  %1295 = load float, float addrspace(3)* %1294, align 4, !tbaa !5
  %1296 = load float, float addrspace(3)* %253, align 4, !tbaa !5
  %1297 = fmul contract float %1295, %1296
  %1298 = fadd contract float %1293, %1297
  store float %1298, float addrspace(3)* %42, align 4, !tbaa !5
  %1299 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 128), i32 %254
  %1300 = load float, float addrspace(3)* %1299, align 4, !tbaa !5
  %1301 = load float, float addrspace(3)* %256, align 4, !tbaa !5
  %1302 = fmul contract float %1300, %1301
  %1303 = fadd contract float %1298, %1302
  store float %1303, float addrspace(3)* %42, align 4, !tbaa !5
  %1304 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 128), i32 %257
  %1305 = load float, float addrspace(3)* %1304, align 4, !tbaa !5
  %1306 = load float, float addrspace(3)* %259, align 4, !tbaa !5
  %1307 = fmul contract float %1305, %1306
  %1308 = fadd contract float %1303, %1307
  store float %1308, float addrspace(3)* %42, align 4, !tbaa !5
  %1309 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 128), i32 %260
  %1310 = load float, float addrspace(3)* %1309, align 4, !tbaa !5
  %1311 = load float, float addrspace(3)* %262, align 4, !tbaa !5
  %1312 = fmul contract float %1310, %1311
  %1313 = fadd contract float %1308, %1312
  store float %1313, float addrspace(3)* %42, align 4, !tbaa !5
  %1314 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 128), i32 %263
  %1315 = load float, float addrspace(3)* %1314, align 4, !tbaa !5
  %1316 = load float, float addrspace(3)* %265, align 4, !tbaa !5
  %1317 = fmul contract float %1315, %1316
  %1318 = fadd contract float %1313, %1317
  store float %1318, float addrspace(3)* %42, align 4, !tbaa !5
  %1319 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 128), i32 %266
  %1320 = load float, float addrspace(3)* %1319, align 4, !tbaa !5
  %1321 = load float, float addrspace(3)* %268, align 4, !tbaa !5
  %1322 = fmul contract float %1320, %1321
  %1323 = fadd contract float %1318, %1322
  store float %1323, float addrspace(3)* %42, align 4, !tbaa !5
  %1324 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 128), i32 %269
  %1325 = load float, float addrspace(3)* %1324, align 4, !tbaa !5
  %1326 = load float, float addrspace(3)* %271, align 4, !tbaa !5
  %1327 = fmul contract float %1325, %1326
  %1328 = fadd contract float %1323, %1327
  store float %1328, float addrspace(3)* %42, align 4, !tbaa !5
  %1329 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 128), i32 %272
  %1330 = load float, float addrspace(3)* %1329, align 4, !tbaa !5
  %1331 = load float, float addrspace(3)* %274, align 4, !tbaa !5
  %1332 = fmul contract float %1330, %1331
  %1333 = fadd contract float %1328, %1332
  store float %1333, float addrspace(3)* %42, align 4, !tbaa !5
  %1334 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 128), i32 %275
  %1335 = load float, float addrspace(3)* %1334, align 4, !tbaa !5
  %1336 = load float, float addrspace(3)* %277, align 4, !tbaa !5
  %1337 = fmul contract float %1335, %1336
  %1338 = fadd contract float %1333, %1337
  store float %1338, float addrspace(3)* %42, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %1339 = getelementptr inbounds float, float addrspace(1)* %1, i64 24576
  %1340 = getelementptr inbounds float, float addrspace(1)* %1339, i64 %44
  %1341 = load float, float addrspace(1)* %1340, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %1341, float addrspace(3)* %45, align 4, !tbaa !5
  %1342 = getelementptr inbounds float, float addrspace(1)* %1339, i64 %46
  %1343 = load float, float addrspace(1)* %1342, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %1343, float addrspace(3)* %47, align 4, !tbaa !5
  %1344 = getelementptr inbounds float, float addrspace(1)* %1339, i64 %48
  %1345 = load float, float addrspace(1)* %1344, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %1345, float addrspace(3)* %49, align 4, !tbaa !5
  %1346 = getelementptr inbounds float, float addrspace(1)* %1339, i64 %50
  %1347 = load float, float addrspace(1)* %1346, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %1347, float addrspace(3)* %51, align 4, !tbaa !5
  %1348 = getelementptr inbounds float, float addrspace(1)* %1339, i64 %53
  %1349 = load float, float addrspace(1)* %1348, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %1349, float addrspace(3)* %54, align 4, !tbaa !5
  %1350 = getelementptr inbounds float, float addrspace(1)* %1339, i64 %56
  %1351 = load float, float addrspace(1)* %1350, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %1351, float addrspace(3)* %57, align 4, !tbaa !5
  %1352 = getelementptr inbounds float, float addrspace(1)* %1339, i64 %59
  %1353 = load float, float addrspace(1)* %1352, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %1353, float addrspace(3)* %60, align 4, !tbaa !5
  %1354 = getelementptr inbounds float, float addrspace(1)* %1339, i64 %62
  %1355 = load float, float addrspace(1)* %1354, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %1355, float addrspace(3)* %63, align 4, !tbaa !5
  %1356 = getelementptr inbounds float, float addrspace(1)* %1339, i64 %65
  %1357 = load float, float addrspace(1)* %1356, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %1357, float addrspace(3)* %66, align 4, !tbaa !5
  %1358 = getelementptr inbounds float, float addrspace(1)* %1339, i64 %68
  %1359 = load float, float addrspace(1)* %1358, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %1359, float addrspace(3)* %69, align 4, !tbaa !5
  %1360 = getelementptr inbounds float, float addrspace(1)* %1339, i64 %71
  %1361 = load float, float addrspace(1)* %1360, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %1361, float addrspace(3)* %72, align 4, !tbaa !5
  %1362 = getelementptr inbounds float, float addrspace(1)* %1339, i64 %74
  %1363 = load float, float addrspace(1)* %1362, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %1363, float addrspace(3)* %75, align 4, !tbaa !5
  %1364 = getelementptr inbounds float, float addrspace(1)* %1339, i64 %77
  %1365 = load float, float addrspace(1)* %1364, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %1365, float addrspace(3)* %78, align 4, !tbaa !5
  %1366 = getelementptr inbounds float, float addrspace(1)* %1339, i64 %80
  %1367 = load float, float addrspace(1)* %1366, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %1367, float addrspace(3)* %81, align 4, !tbaa !5
  %1368 = getelementptr inbounds float, float addrspace(1)* %1339, i64 %83
  %1369 = load float, float addrspace(1)* %1368, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %1369, float addrspace(3)* %84, align 4, !tbaa !5
  %1370 = getelementptr inbounds float, float addrspace(1)* %1339, i64 %86
  %1371 = load float, float addrspace(1)* %1370, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %1371, float addrspace(3)* %87, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %1372 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 192), i32 %43
  %1373 = load float, float addrspace(3)* %1372, align 4, !tbaa !5
  %1374 = load float, float addrspace(3)* %88, align 4, !tbaa !5
  %1375 = fmul contract float %1373, %1374
  %1376 = load float, float addrspace(3)* %42, align 4, !tbaa !5
  %1377 = fadd contract float %1376, %1375
  store float %1377, float addrspace(3)* %42, align 4, !tbaa !5
  %1378 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 192), i32 %89
  %1379 = load float, float addrspace(3)* %1378, align 4, !tbaa !5
  %1380 = load float, float addrspace(3)* %91, align 4, !tbaa !5
  %1381 = fmul contract float %1379, %1380
  %1382 = fadd contract float %1377, %1381
  store float %1382, float addrspace(3)* %42, align 4, !tbaa !5
  %1383 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 192), i32 %92
  %1384 = load float, float addrspace(3)* %1383, align 4, !tbaa !5
  %1385 = load float, float addrspace(3)* %94, align 4, !tbaa !5
  %1386 = fmul contract float %1384, %1385
  %1387 = fadd contract float %1382, %1386
  store float %1387, float addrspace(3)* %42, align 4, !tbaa !5
  %1388 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 192), i32 %95
  %1389 = load float, float addrspace(3)* %1388, align 4, !tbaa !5
  %1390 = load float, float addrspace(3)* %97, align 4, !tbaa !5
  %1391 = fmul contract float %1389, %1390
  %1392 = fadd contract float %1387, %1391
  store float %1392, float addrspace(3)* %42, align 4, !tbaa !5
  %1393 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 192), i32 %98
  %1394 = load float, float addrspace(3)* %1393, align 4, !tbaa !5
  %1395 = load float, float addrspace(3)* %100, align 4, !tbaa !5
  %1396 = fmul contract float %1394, %1395
  %1397 = fadd contract float %1392, %1396
  store float %1397, float addrspace(3)* %42, align 4, !tbaa !5
  %1398 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 192), i32 %101
  %1399 = load float, float addrspace(3)* %1398, align 4, !tbaa !5
  %1400 = load float, float addrspace(3)* %103, align 4, !tbaa !5
  %1401 = fmul contract float %1399, %1400
  %1402 = fadd contract float %1397, %1401
  store float %1402, float addrspace(3)* %42, align 4, !tbaa !5
  %1403 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 192), i32 %104
  %1404 = load float, float addrspace(3)* %1403, align 4, !tbaa !5
  %1405 = load float, float addrspace(3)* %106, align 4, !tbaa !5
  %1406 = fmul contract float %1404, %1405
  %1407 = fadd contract float %1402, %1406
  store float %1407, float addrspace(3)* %42, align 4, !tbaa !5
  %1408 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 192), i32 %107
  %1409 = load float, float addrspace(3)* %1408, align 4, !tbaa !5
  %1410 = load float, float addrspace(3)* %109, align 4, !tbaa !5
  %1411 = fmul contract float %1409, %1410
  %1412 = fadd contract float %1407, %1411
  store float %1412, float addrspace(3)* %42, align 4, !tbaa !5
  %1413 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 192), i32 %110
  %1414 = load float, float addrspace(3)* %1413, align 4, !tbaa !5
  %1415 = load float, float addrspace(3)* %112, align 4, !tbaa !5
  %1416 = fmul contract float %1414, %1415
  %1417 = fadd contract float %1412, %1416
  store float %1417, float addrspace(3)* %42, align 4, !tbaa !5
  %1418 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 192), i32 %113
  %1419 = load float, float addrspace(3)* %1418, align 4, !tbaa !5
  %1420 = load float, float addrspace(3)* %115, align 4, !tbaa !5
  %1421 = fmul contract float %1419, %1420
  %1422 = fadd contract float %1417, %1421
  store float %1422, float addrspace(3)* %42, align 4, !tbaa !5
  %1423 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 192), i32 %116
  %1424 = load float, float addrspace(3)* %1423, align 4, !tbaa !5
  %1425 = load float, float addrspace(3)* %118, align 4, !tbaa !5
  %1426 = fmul contract float %1424, %1425
  %1427 = fadd contract float %1422, %1426
  store float %1427, float addrspace(3)* %42, align 4, !tbaa !5
  %1428 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 192), i32 %119
  %1429 = load float, float addrspace(3)* %1428, align 4, !tbaa !5
  %1430 = load float, float addrspace(3)* %121, align 4, !tbaa !5
  %1431 = fmul contract float %1429, %1430
  %1432 = fadd contract float %1427, %1431
  store float %1432, float addrspace(3)* %42, align 4, !tbaa !5
  %1433 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 192), i32 %122
  %1434 = load float, float addrspace(3)* %1433, align 4, !tbaa !5
  %1435 = load float, float addrspace(3)* %124, align 4, !tbaa !5
  %1436 = fmul contract float %1434, %1435
  %1437 = fadd contract float %1432, %1436
  store float %1437, float addrspace(3)* %42, align 4, !tbaa !5
  %1438 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 192), i32 %125
  %1439 = load float, float addrspace(3)* %1438, align 4, !tbaa !5
  %1440 = load float, float addrspace(3)* %127, align 4, !tbaa !5
  %1441 = fmul contract float %1439, %1440
  %1442 = fadd contract float %1437, %1441
  store float %1442, float addrspace(3)* %42, align 4, !tbaa !5
  %1443 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 192), i32 %128
  %1444 = load float, float addrspace(3)* %1443, align 4, !tbaa !5
  %1445 = load float, float addrspace(3)* %130, align 4, !tbaa !5
  %1446 = fmul contract float %1444, %1445
  %1447 = fadd contract float %1442, %1446
  store float %1447, float addrspace(3)* %42, align 4, !tbaa !5
  %1448 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 192), i32 %131
  %1449 = load float, float addrspace(3)* %1448, align 4, !tbaa !5
  %1450 = load float, float addrspace(3)* %133, align 4, !tbaa !5
  %1451 = fmul contract float %1449, %1450
  %1452 = fadd contract float %1447, %1451
  store float %1452, float addrspace(3)* %42, align 4, !tbaa !5
  %1453 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 192), i32 %134
  %1454 = load float, float addrspace(3)* %1453, align 4, !tbaa !5
  %1455 = load float, float addrspace(3)* %136, align 4, !tbaa !5
  %1456 = fmul contract float %1454, %1455
  %1457 = fadd contract float %1452, %1456
  store float %1457, float addrspace(3)* %42, align 4, !tbaa !5
  %1458 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 192), i32 %137
  %1459 = load float, float addrspace(3)* %1458, align 4, !tbaa !5
  %1460 = load float, float addrspace(3)* %139, align 4, !tbaa !5
  %1461 = fmul contract float %1459, %1460
  %1462 = fadd contract float %1457, %1461
  store float %1462, float addrspace(3)* %42, align 4, !tbaa !5
  %1463 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 192), i32 %140
  %1464 = load float, float addrspace(3)* %1463, align 4, !tbaa !5
  %1465 = load float, float addrspace(3)* %142, align 4, !tbaa !5
  %1466 = fmul contract float %1464, %1465
  %1467 = fadd contract float %1462, %1466
  store float %1467, float addrspace(3)* %42, align 4, !tbaa !5
  %1468 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 192), i32 %143
  %1469 = load float, float addrspace(3)* %1468, align 4, !tbaa !5
  %1470 = load float, float addrspace(3)* %145, align 4, !tbaa !5
  %1471 = fmul contract float %1469, %1470
  %1472 = fadd contract float %1467, %1471
  store float %1472, float addrspace(3)* %42, align 4, !tbaa !5
  %1473 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 192), i32 %146
  %1474 = load float, float addrspace(3)* %1473, align 4, !tbaa !5
  %1475 = load float, float addrspace(3)* %148, align 4, !tbaa !5
  %1476 = fmul contract float %1474, %1475
  %1477 = fadd contract float %1472, %1476
  store float %1477, float addrspace(3)* %42, align 4, !tbaa !5
  %1478 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 192), i32 %149
  %1479 = load float, float addrspace(3)* %1478, align 4, !tbaa !5
  %1480 = load float, float addrspace(3)* %151, align 4, !tbaa !5
  %1481 = fmul contract float %1479, %1480
  %1482 = fadd contract float %1477, %1481
  store float %1482, float addrspace(3)* %42, align 4, !tbaa !5
  %1483 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 192), i32 %152
  %1484 = load float, float addrspace(3)* %1483, align 4, !tbaa !5
  %1485 = load float, float addrspace(3)* %154, align 4, !tbaa !5
  %1486 = fmul contract float %1484, %1485
  %1487 = fadd contract float %1482, %1486
  store float %1487, float addrspace(3)* %42, align 4, !tbaa !5
  %1488 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 192), i32 %155
  %1489 = load float, float addrspace(3)* %1488, align 4, !tbaa !5
  %1490 = load float, float addrspace(3)* %157, align 4, !tbaa !5
  %1491 = fmul contract float %1489, %1490
  %1492 = fadd contract float %1487, %1491
  store float %1492, float addrspace(3)* %42, align 4, !tbaa !5
  %1493 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 192), i32 %158
  %1494 = load float, float addrspace(3)* %1493, align 4, !tbaa !5
  %1495 = load float, float addrspace(3)* %160, align 4, !tbaa !5
  %1496 = fmul contract float %1494, %1495
  %1497 = fadd contract float %1492, %1496
  store float %1497, float addrspace(3)* %42, align 4, !tbaa !5
  %1498 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 192), i32 %161
  %1499 = load float, float addrspace(3)* %1498, align 4, !tbaa !5
  %1500 = load float, float addrspace(3)* %163, align 4, !tbaa !5
  %1501 = fmul contract float %1499, %1500
  %1502 = fadd contract float %1497, %1501
  store float %1502, float addrspace(3)* %42, align 4, !tbaa !5
  %1503 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 192), i32 %164
  %1504 = load float, float addrspace(3)* %1503, align 4, !tbaa !5
  %1505 = load float, float addrspace(3)* %166, align 4, !tbaa !5
  %1506 = fmul contract float %1504, %1505
  %1507 = fadd contract float %1502, %1506
  store float %1507, float addrspace(3)* %42, align 4, !tbaa !5
  %1508 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 192), i32 %167
  %1509 = load float, float addrspace(3)* %1508, align 4, !tbaa !5
  %1510 = load float, float addrspace(3)* %169, align 4, !tbaa !5
  %1511 = fmul contract float %1509, %1510
  %1512 = fadd contract float %1507, %1511
  store float %1512, float addrspace(3)* %42, align 4, !tbaa !5
  %1513 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 192), i32 %170
  %1514 = load float, float addrspace(3)* %1513, align 4, !tbaa !5
  %1515 = load float, float addrspace(3)* %172, align 4, !tbaa !5
  %1516 = fmul contract float %1514, %1515
  %1517 = fadd contract float %1512, %1516
  store float %1517, float addrspace(3)* %42, align 4, !tbaa !5
  %1518 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 192), i32 %173
  %1519 = load float, float addrspace(3)* %1518, align 4, !tbaa !5
  %1520 = load float, float addrspace(3)* %175, align 4, !tbaa !5
  %1521 = fmul contract float %1519, %1520
  %1522 = fadd contract float %1517, %1521
  store float %1522, float addrspace(3)* %42, align 4, !tbaa !5
  %1523 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 192), i32 %176
  %1524 = load float, float addrspace(3)* %1523, align 4, !tbaa !5
  %1525 = load float, float addrspace(3)* %178, align 4, !tbaa !5
  %1526 = fmul contract float %1524, %1525
  %1527 = fadd contract float %1522, %1526
  store float %1527, float addrspace(3)* %42, align 4, !tbaa !5
  %1528 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 192), i32 %179
  %1529 = load float, float addrspace(3)* %1528, align 4, !tbaa !5
  %1530 = load float, float addrspace(3)* %181, align 4, !tbaa !5
  %1531 = fmul contract float %1529, %1530
  %1532 = fadd contract float %1527, %1531
  store float %1532, float addrspace(3)* %42, align 4, !tbaa !5
  %1533 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 192), i32 %182
  %1534 = load float, float addrspace(3)* %1533, align 4, !tbaa !5
  %1535 = load float, float addrspace(3)* %184, align 4, !tbaa !5
  %1536 = fmul contract float %1534, %1535
  %1537 = fadd contract float %1532, %1536
  store float %1537, float addrspace(3)* %42, align 4, !tbaa !5
  %1538 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 192), i32 %185
  %1539 = load float, float addrspace(3)* %1538, align 4, !tbaa !5
  %1540 = load float, float addrspace(3)* %187, align 4, !tbaa !5
  %1541 = fmul contract float %1539, %1540
  %1542 = fadd contract float %1537, %1541
  store float %1542, float addrspace(3)* %42, align 4, !tbaa !5
  %1543 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 192), i32 %188
  %1544 = load float, float addrspace(3)* %1543, align 4, !tbaa !5
  %1545 = load float, float addrspace(3)* %190, align 4, !tbaa !5
  %1546 = fmul contract float %1544, %1545
  %1547 = fadd contract float %1542, %1546
  store float %1547, float addrspace(3)* %42, align 4, !tbaa !5
  %1548 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 192), i32 %191
  %1549 = load float, float addrspace(3)* %1548, align 4, !tbaa !5
  %1550 = load float, float addrspace(3)* %193, align 4, !tbaa !5
  %1551 = fmul contract float %1549, %1550
  %1552 = fadd contract float %1547, %1551
  store float %1552, float addrspace(3)* %42, align 4, !tbaa !5
  %1553 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 192), i32 %194
  %1554 = load float, float addrspace(3)* %1553, align 4, !tbaa !5
  %1555 = load float, float addrspace(3)* %196, align 4, !tbaa !5
  %1556 = fmul contract float %1554, %1555
  %1557 = fadd contract float %1552, %1556
  store float %1557, float addrspace(3)* %42, align 4, !tbaa !5
  %1558 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 192), i32 %197
  %1559 = load float, float addrspace(3)* %1558, align 4, !tbaa !5
  %1560 = load float, float addrspace(3)* %199, align 4, !tbaa !5
  %1561 = fmul contract float %1559, %1560
  %1562 = fadd contract float %1557, %1561
  store float %1562, float addrspace(3)* %42, align 4, !tbaa !5
  %1563 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 192), i32 %200
  %1564 = load float, float addrspace(3)* %1563, align 4, !tbaa !5
  %1565 = load float, float addrspace(3)* %202, align 4, !tbaa !5
  %1566 = fmul contract float %1564, %1565
  %1567 = fadd contract float %1562, %1566
  store float %1567, float addrspace(3)* %42, align 4, !tbaa !5
  %1568 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 192), i32 %203
  %1569 = load float, float addrspace(3)* %1568, align 4, !tbaa !5
  %1570 = load float, float addrspace(3)* %205, align 4, !tbaa !5
  %1571 = fmul contract float %1569, %1570
  %1572 = fadd contract float %1567, %1571
  store float %1572, float addrspace(3)* %42, align 4, !tbaa !5
  %1573 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 192), i32 %206
  %1574 = load float, float addrspace(3)* %1573, align 4, !tbaa !5
  %1575 = load float, float addrspace(3)* %208, align 4, !tbaa !5
  %1576 = fmul contract float %1574, %1575
  %1577 = fadd contract float %1572, %1576
  store float %1577, float addrspace(3)* %42, align 4, !tbaa !5
  %1578 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 192), i32 %209
  %1579 = load float, float addrspace(3)* %1578, align 4, !tbaa !5
  %1580 = load float, float addrspace(3)* %211, align 4, !tbaa !5
  %1581 = fmul contract float %1579, %1580
  %1582 = fadd contract float %1577, %1581
  store float %1582, float addrspace(3)* %42, align 4, !tbaa !5
  %1583 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 192), i32 %212
  %1584 = load float, float addrspace(3)* %1583, align 4, !tbaa !5
  %1585 = load float, float addrspace(3)* %214, align 4, !tbaa !5
  %1586 = fmul contract float %1584, %1585
  %1587 = fadd contract float %1582, %1586
  store float %1587, float addrspace(3)* %42, align 4, !tbaa !5
  %1588 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 192), i32 %215
  %1589 = load float, float addrspace(3)* %1588, align 4, !tbaa !5
  %1590 = load float, float addrspace(3)* %217, align 4, !tbaa !5
  %1591 = fmul contract float %1589, %1590
  %1592 = fadd contract float %1587, %1591
  store float %1592, float addrspace(3)* %42, align 4, !tbaa !5
  %1593 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 192), i32 %218
  %1594 = load float, float addrspace(3)* %1593, align 4, !tbaa !5
  %1595 = load float, float addrspace(3)* %220, align 4, !tbaa !5
  %1596 = fmul contract float %1594, %1595
  %1597 = fadd contract float %1592, %1596
  store float %1597, float addrspace(3)* %42, align 4, !tbaa !5
  %1598 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 192), i32 %221
  %1599 = load float, float addrspace(3)* %1598, align 4, !tbaa !5
  %1600 = load float, float addrspace(3)* %223, align 4, !tbaa !5
  %1601 = fmul contract float %1599, %1600
  %1602 = fadd contract float %1597, %1601
  store float %1602, float addrspace(3)* %42, align 4, !tbaa !5
  %1603 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 192), i32 %224
  %1604 = load float, float addrspace(3)* %1603, align 4, !tbaa !5
  %1605 = load float, float addrspace(3)* %226, align 4, !tbaa !5
  %1606 = fmul contract float %1604, %1605
  %1607 = fadd contract float %1602, %1606
  store float %1607, float addrspace(3)* %42, align 4, !tbaa !5
  %1608 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 192), i32 %227
  %1609 = load float, float addrspace(3)* %1608, align 4, !tbaa !5
  %1610 = load float, float addrspace(3)* %229, align 4, !tbaa !5
  %1611 = fmul contract float %1609, %1610
  %1612 = fadd contract float %1607, %1611
  store float %1612, float addrspace(3)* %42, align 4, !tbaa !5
  %1613 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 192), i32 %230
  %1614 = load float, float addrspace(3)* %1613, align 4, !tbaa !5
  %1615 = load float, float addrspace(3)* %232, align 4, !tbaa !5
  %1616 = fmul contract float %1614, %1615
  %1617 = fadd contract float %1612, %1616
  store float %1617, float addrspace(3)* %42, align 4, !tbaa !5
  %1618 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 192), i32 %233
  %1619 = load float, float addrspace(3)* %1618, align 4, !tbaa !5
  %1620 = load float, float addrspace(3)* %235, align 4, !tbaa !5
  %1621 = fmul contract float %1619, %1620
  %1622 = fadd contract float %1617, %1621
  store float %1622, float addrspace(3)* %42, align 4, !tbaa !5
  %1623 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 192), i32 %236
  %1624 = load float, float addrspace(3)* %1623, align 4, !tbaa !5
  %1625 = load float, float addrspace(3)* %238, align 4, !tbaa !5
  %1626 = fmul contract float %1624, %1625
  %1627 = fadd contract float %1622, %1626
  store float %1627, float addrspace(3)* %42, align 4, !tbaa !5
  %1628 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 192), i32 %239
  %1629 = load float, float addrspace(3)* %1628, align 4, !tbaa !5
  %1630 = load float, float addrspace(3)* %241, align 4, !tbaa !5
  %1631 = fmul contract float %1629, %1630
  %1632 = fadd contract float %1627, %1631
  store float %1632, float addrspace(3)* %42, align 4, !tbaa !5
  %1633 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 192), i32 %242
  %1634 = load float, float addrspace(3)* %1633, align 4, !tbaa !5
  %1635 = load float, float addrspace(3)* %244, align 4, !tbaa !5
  %1636 = fmul contract float %1634, %1635
  %1637 = fadd contract float %1632, %1636
  store float %1637, float addrspace(3)* %42, align 4, !tbaa !5
  %1638 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 192), i32 %245
  %1639 = load float, float addrspace(3)* %1638, align 4, !tbaa !5
  %1640 = load float, float addrspace(3)* %247, align 4, !tbaa !5
  %1641 = fmul contract float %1639, %1640
  %1642 = fadd contract float %1637, %1641
  store float %1642, float addrspace(3)* %42, align 4, !tbaa !5
  %1643 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 192), i32 %248
  %1644 = load float, float addrspace(3)* %1643, align 4, !tbaa !5
  %1645 = load float, float addrspace(3)* %250, align 4, !tbaa !5
  %1646 = fmul contract float %1644, %1645
  %1647 = fadd contract float %1642, %1646
  store float %1647, float addrspace(3)* %42, align 4, !tbaa !5
  %1648 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 192), i32 %251
  %1649 = load float, float addrspace(3)* %1648, align 4, !tbaa !5
  %1650 = load float, float addrspace(3)* %253, align 4, !tbaa !5
  %1651 = fmul contract float %1649, %1650
  %1652 = fadd contract float %1647, %1651
  store float %1652, float addrspace(3)* %42, align 4, !tbaa !5
  %1653 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 192), i32 %254
  %1654 = load float, float addrspace(3)* %1653, align 4, !tbaa !5
  %1655 = load float, float addrspace(3)* %256, align 4, !tbaa !5
  %1656 = fmul contract float %1654, %1655
  %1657 = fadd contract float %1652, %1656
  store float %1657, float addrspace(3)* %42, align 4, !tbaa !5
  %1658 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 192), i32 %257
  %1659 = load float, float addrspace(3)* %1658, align 4, !tbaa !5
  %1660 = load float, float addrspace(3)* %259, align 4, !tbaa !5
  %1661 = fmul contract float %1659, %1660
  %1662 = fadd contract float %1657, %1661
  store float %1662, float addrspace(3)* %42, align 4, !tbaa !5
  %1663 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 192), i32 %260
  %1664 = load float, float addrspace(3)* %1663, align 4, !tbaa !5
  %1665 = load float, float addrspace(3)* %262, align 4, !tbaa !5
  %1666 = fmul contract float %1664, %1665
  %1667 = fadd contract float %1662, %1666
  store float %1667, float addrspace(3)* %42, align 4, !tbaa !5
  %1668 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 192), i32 %263
  %1669 = load float, float addrspace(3)* %1668, align 4, !tbaa !5
  %1670 = load float, float addrspace(3)* %265, align 4, !tbaa !5
  %1671 = fmul contract float %1669, %1670
  %1672 = fadd contract float %1667, %1671
  store float %1672, float addrspace(3)* %42, align 4, !tbaa !5
  %1673 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 192), i32 %266
  %1674 = load float, float addrspace(3)* %1673, align 4, !tbaa !5
  %1675 = load float, float addrspace(3)* %268, align 4, !tbaa !5
  %1676 = fmul contract float %1674, %1675
  %1677 = fadd contract float %1672, %1676
  store float %1677, float addrspace(3)* %42, align 4, !tbaa !5
  %1678 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 192), i32 %269
  %1679 = load float, float addrspace(3)* %1678, align 4, !tbaa !5
  %1680 = load float, float addrspace(3)* %271, align 4, !tbaa !5
  %1681 = fmul contract float %1679, %1680
  %1682 = fadd contract float %1677, %1681
  store float %1682, float addrspace(3)* %42, align 4, !tbaa !5
  %1683 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 192), i32 %272
  %1684 = load float, float addrspace(3)* %1683, align 4, !tbaa !5
  %1685 = load float, float addrspace(3)* %274, align 4, !tbaa !5
  %1686 = fmul contract float %1684, %1685
  %1687 = fadd contract float %1682, %1686
  store float %1687, float addrspace(3)* %42, align 4, !tbaa !5
  %1688 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 192), i32 %275
  %1689 = load float, float addrspace(3)* %1688, align 4, !tbaa !5
  %1690 = load float, float addrspace(3)* %277, align 4, !tbaa !5
  %1691 = fmul contract float %1689, %1690
  %1692 = fadd contract float %1687, %1691
  store float %1692, float addrspace(3)* %42, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %1693 = getelementptr inbounds float, float addrspace(1)* %1, i64 32768
  %1694 = getelementptr inbounds float, float addrspace(1)* %1693, i64 %44
  %1695 = load float, float addrspace(1)* %1694, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %1695, float addrspace(3)* %45, align 4, !tbaa !5
  %1696 = getelementptr inbounds float, float addrspace(1)* %1693, i64 %46
  %1697 = load float, float addrspace(1)* %1696, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %1697, float addrspace(3)* %47, align 4, !tbaa !5
  %1698 = getelementptr inbounds float, float addrspace(1)* %1693, i64 %48
  %1699 = load float, float addrspace(1)* %1698, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %1699, float addrspace(3)* %49, align 4, !tbaa !5
  %1700 = getelementptr inbounds float, float addrspace(1)* %1693, i64 %50
  %1701 = load float, float addrspace(1)* %1700, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %1701, float addrspace(3)* %51, align 4, !tbaa !5
  %1702 = getelementptr inbounds float, float addrspace(1)* %1693, i64 %53
  %1703 = load float, float addrspace(1)* %1702, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %1703, float addrspace(3)* %54, align 4, !tbaa !5
  %1704 = getelementptr inbounds float, float addrspace(1)* %1693, i64 %56
  %1705 = load float, float addrspace(1)* %1704, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %1705, float addrspace(3)* %57, align 4, !tbaa !5
  %1706 = getelementptr inbounds float, float addrspace(1)* %1693, i64 %59
  %1707 = load float, float addrspace(1)* %1706, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %1707, float addrspace(3)* %60, align 4, !tbaa !5
  %1708 = getelementptr inbounds float, float addrspace(1)* %1693, i64 %62
  %1709 = load float, float addrspace(1)* %1708, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %1709, float addrspace(3)* %63, align 4, !tbaa !5
  %1710 = getelementptr inbounds float, float addrspace(1)* %1693, i64 %65
  %1711 = load float, float addrspace(1)* %1710, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %1711, float addrspace(3)* %66, align 4, !tbaa !5
  %1712 = getelementptr inbounds float, float addrspace(1)* %1693, i64 %68
  %1713 = load float, float addrspace(1)* %1712, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %1713, float addrspace(3)* %69, align 4, !tbaa !5
  %1714 = getelementptr inbounds float, float addrspace(1)* %1693, i64 %71
  %1715 = load float, float addrspace(1)* %1714, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %1715, float addrspace(3)* %72, align 4, !tbaa !5
  %1716 = getelementptr inbounds float, float addrspace(1)* %1693, i64 %74
  %1717 = load float, float addrspace(1)* %1716, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %1717, float addrspace(3)* %75, align 4, !tbaa !5
  %1718 = getelementptr inbounds float, float addrspace(1)* %1693, i64 %77
  %1719 = load float, float addrspace(1)* %1718, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %1719, float addrspace(3)* %78, align 4, !tbaa !5
  %1720 = getelementptr inbounds float, float addrspace(1)* %1693, i64 %80
  %1721 = load float, float addrspace(1)* %1720, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %1721, float addrspace(3)* %81, align 4, !tbaa !5
  %1722 = getelementptr inbounds float, float addrspace(1)* %1693, i64 %83
  %1723 = load float, float addrspace(1)* %1722, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %1723, float addrspace(3)* %84, align 4, !tbaa !5
  %1724 = getelementptr inbounds float, float addrspace(1)* %1693, i64 %86
  %1725 = load float, float addrspace(1)* %1724, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %1725, float addrspace(3)* %87, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %1726 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 256), i32 %43
  %1727 = load float, float addrspace(3)* %1726, align 4, !tbaa !5
  %1728 = load float, float addrspace(3)* %88, align 4, !tbaa !5
  %1729 = fmul contract float %1727, %1728
  %1730 = load float, float addrspace(3)* %42, align 4, !tbaa !5
  %1731 = fadd contract float %1730, %1729
  store float %1731, float addrspace(3)* %42, align 4, !tbaa !5
  %1732 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 256), i32 %89
  %1733 = load float, float addrspace(3)* %1732, align 4, !tbaa !5
  %1734 = load float, float addrspace(3)* %91, align 4, !tbaa !5
  %1735 = fmul contract float %1733, %1734
  %1736 = fadd contract float %1731, %1735
  store float %1736, float addrspace(3)* %42, align 4, !tbaa !5
  %1737 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 256), i32 %92
  %1738 = load float, float addrspace(3)* %1737, align 4, !tbaa !5
  %1739 = load float, float addrspace(3)* %94, align 4, !tbaa !5
  %1740 = fmul contract float %1738, %1739
  %1741 = fadd contract float %1736, %1740
  store float %1741, float addrspace(3)* %42, align 4, !tbaa !5
  %1742 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 256), i32 %95
  %1743 = load float, float addrspace(3)* %1742, align 4, !tbaa !5
  %1744 = load float, float addrspace(3)* %97, align 4, !tbaa !5
  %1745 = fmul contract float %1743, %1744
  %1746 = fadd contract float %1741, %1745
  store float %1746, float addrspace(3)* %42, align 4, !tbaa !5
  %1747 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 256), i32 %98
  %1748 = load float, float addrspace(3)* %1747, align 4, !tbaa !5
  %1749 = load float, float addrspace(3)* %100, align 4, !tbaa !5
  %1750 = fmul contract float %1748, %1749
  %1751 = fadd contract float %1746, %1750
  store float %1751, float addrspace(3)* %42, align 4, !tbaa !5
  %1752 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 256), i32 %101
  %1753 = load float, float addrspace(3)* %1752, align 4, !tbaa !5
  %1754 = load float, float addrspace(3)* %103, align 4, !tbaa !5
  %1755 = fmul contract float %1753, %1754
  %1756 = fadd contract float %1751, %1755
  store float %1756, float addrspace(3)* %42, align 4, !tbaa !5
  %1757 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 256), i32 %104
  %1758 = load float, float addrspace(3)* %1757, align 4, !tbaa !5
  %1759 = load float, float addrspace(3)* %106, align 4, !tbaa !5
  %1760 = fmul contract float %1758, %1759
  %1761 = fadd contract float %1756, %1760
  store float %1761, float addrspace(3)* %42, align 4, !tbaa !5
  %1762 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 256), i32 %107
  %1763 = load float, float addrspace(3)* %1762, align 4, !tbaa !5
  %1764 = load float, float addrspace(3)* %109, align 4, !tbaa !5
  %1765 = fmul contract float %1763, %1764
  %1766 = fadd contract float %1761, %1765
  store float %1766, float addrspace(3)* %42, align 4, !tbaa !5
  %1767 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 256), i32 %110
  %1768 = load float, float addrspace(3)* %1767, align 4, !tbaa !5
  %1769 = load float, float addrspace(3)* %112, align 4, !tbaa !5
  %1770 = fmul contract float %1768, %1769
  %1771 = fadd contract float %1766, %1770
  store float %1771, float addrspace(3)* %42, align 4, !tbaa !5
  %1772 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 256), i32 %113
  %1773 = load float, float addrspace(3)* %1772, align 4, !tbaa !5
  %1774 = load float, float addrspace(3)* %115, align 4, !tbaa !5
  %1775 = fmul contract float %1773, %1774
  %1776 = fadd contract float %1771, %1775
  store float %1776, float addrspace(3)* %42, align 4, !tbaa !5
  %1777 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 256), i32 %116
  %1778 = load float, float addrspace(3)* %1777, align 4, !tbaa !5
  %1779 = load float, float addrspace(3)* %118, align 4, !tbaa !5
  %1780 = fmul contract float %1778, %1779
  %1781 = fadd contract float %1776, %1780
  store float %1781, float addrspace(3)* %42, align 4, !tbaa !5
  %1782 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 256), i32 %119
  %1783 = load float, float addrspace(3)* %1782, align 4, !tbaa !5
  %1784 = load float, float addrspace(3)* %121, align 4, !tbaa !5
  %1785 = fmul contract float %1783, %1784
  %1786 = fadd contract float %1781, %1785
  store float %1786, float addrspace(3)* %42, align 4, !tbaa !5
  %1787 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 256), i32 %122
  %1788 = load float, float addrspace(3)* %1787, align 4, !tbaa !5
  %1789 = load float, float addrspace(3)* %124, align 4, !tbaa !5
  %1790 = fmul contract float %1788, %1789
  %1791 = fadd contract float %1786, %1790
  store float %1791, float addrspace(3)* %42, align 4, !tbaa !5
  %1792 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 256), i32 %125
  %1793 = load float, float addrspace(3)* %1792, align 4, !tbaa !5
  %1794 = load float, float addrspace(3)* %127, align 4, !tbaa !5
  %1795 = fmul contract float %1793, %1794
  %1796 = fadd contract float %1791, %1795
  store float %1796, float addrspace(3)* %42, align 4, !tbaa !5
  %1797 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 256), i32 %128
  %1798 = load float, float addrspace(3)* %1797, align 4, !tbaa !5
  %1799 = load float, float addrspace(3)* %130, align 4, !tbaa !5
  %1800 = fmul contract float %1798, %1799
  %1801 = fadd contract float %1796, %1800
  store float %1801, float addrspace(3)* %42, align 4, !tbaa !5
  %1802 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 256), i32 %131
  %1803 = load float, float addrspace(3)* %1802, align 4, !tbaa !5
  %1804 = load float, float addrspace(3)* %133, align 4, !tbaa !5
  %1805 = fmul contract float %1803, %1804
  %1806 = fadd contract float %1801, %1805
  store float %1806, float addrspace(3)* %42, align 4, !tbaa !5
  %1807 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 256), i32 %134
  %1808 = load float, float addrspace(3)* %1807, align 4, !tbaa !5
  %1809 = load float, float addrspace(3)* %136, align 4, !tbaa !5
  %1810 = fmul contract float %1808, %1809
  %1811 = fadd contract float %1806, %1810
  store float %1811, float addrspace(3)* %42, align 4, !tbaa !5
  %1812 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 256), i32 %137
  %1813 = load float, float addrspace(3)* %1812, align 4, !tbaa !5
  %1814 = load float, float addrspace(3)* %139, align 4, !tbaa !5
  %1815 = fmul contract float %1813, %1814
  %1816 = fadd contract float %1811, %1815
  store float %1816, float addrspace(3)* %42, align 4, !tbaa !5
  %1817 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 256), i32 %140
  %1818 = load float, float addrspace(3)* %1817, align 4, !tbaa !5
  %1819 = load float, float addrspace(3)* %142, align 4, !tbaa !5
  %1820 = fmul contract float %1818, %1819
  %1821 = fadd contract float %1816, %1820
  store float %1821, float addrspace(3)* %42, align 4, !tbaa !5
  %1822 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 256), i32 %143
  %1823 = load float, float addrspace(3)* %1822, align 4, !tbaa !5
  %1824 = load float, float addrspace(3)* %145, align 4, !tbaa !5
  %1825 = fmul contract float %1823, %1824
  %1826 = fadd contract float %1821, %1825
  store float %1826, float addrspace(3)* %42, align 4, !tbaa !5
  %1827 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 256), i32 %146
  %1828 = load float, float addrspace(3)* %1827, align 4, !tbaa !5
  %1829 = load float, float addrspace(3)* %148, align 4, !tbaa !5
  %1830 = fmul contract float %1828, %1829
  %1831 = fadd contract float %1826, %1830
  store float %1831, float addrspace(3)* %42, align 4, !tbaa !5
  %1832 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 256), i32 %149
  %1833 = load float, float addrspace(3)* %1832, align 4, !tbaa !5
  %1834 = load float, float addrspace(3)* %151, align 4, !tbaa !5
  %1835 = fmul contract float %1833, %1834
  %1836 = fadd contract float %1831, %1835
  store float %1836, float addrspace(3)* %42, align 4, !tbaa !5
  %1837 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 256), i32 %152
  %1838 = load float, float addrspace(3)* %1837, align 4, !tbaa !5
  %1839 = load float, float addrspace(3)* %154, align 4, !tbaa !5
  %1840 = fmul contract float %1838, %1839
  %1841 = fadd contract float %1836, %1840
  store float %1841, float addrspace(3)* %42, align 4, !tbaa !5
  %1842 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 256), i32 %155
  %1843 = load float, float addrspace(3)* %1842, align 4, !tbaa !5
  %1844 = load float, float addrspace(3)* %157, align 4, !tbaa !5
  %1845 = fmul contract float %1843, %1844
  %1846 = fadd contract float %1841, %1845
  store float %1846, float addrspace(3)* %42, align 4, !tbaa !5
  %1847 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 256), i32 %158
  %1848 = load float, float addrspace(3)* %1847, align 4, !tbaa !5
  %1849 = load float, float addrspace(3)* %160, align 4, !tbaa !5
  %1850 = fmul contract float %1848, %1849
  %1851 = fadd contract float %1846, %1850
  store float %1851, float addrspace(3)* %42, align 4, !tbaa !5
  %1852 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 256), i32 %161
  %1853 = load float, float addrspace(3)* %1852, align 4, !tbaa !5
  %1854 = load float, float addrspace(3)* %163, align 4, !tbaa !5
  %1855 = fmul contract float %1853, %1854
  %1856 = fadd contract float %1851, %1855
  store float %1856, float addrspace(3)* %42, align 4, !tbaa !5
  %1857 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 256), i32 %164
  %1858 = load float, float addrspace(3)* %1857, align 4, !tbaa !5
  %1859 = load float, float addrspace(3)* %166, align 4, !tbaa !5
  %1860 = fmul contract float %1858, %1859
  %1861 = fadd contract float %1856, %1860
  store float %1861, float addrspace(3)* %42, align 4, !tbaa !5
  %1862 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 256), i32 %167
  %1863 = load float, float addrspace(3)* %1862, align 4, !tbaa !5
  %1864 = load float, float addrspace(3)* %169, align 4, !tbaa !5
  %1865 = fmul contract float %1863, %1864
  %1866 = fadd contract float %1861, %1865
  store float %1866, float addrspace(3)* %42, align 4, !tbaa !5
  %1867 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 256), i32 %170
  %1868 = load float, float addrspace(3)* %1867, align 4, !tbaa !5
  %1869 = load float, float addrspace(3)* %172, align 4, !tbaa !5
  %1870 = fmul contract float %1868, %1869
  %1871 = fadd contract float %1866, %1870
  store float %1871, float addrspace(3)* %42, align 4, !tbaa !5
  %1872 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 256), i32 %173
  %1873 = load float, float addrspace(3)* %1872, align 4, !tbaa !5
  %1874 = load float, float addrspace(3)* %175, align 4, !tbaa !5
  %1875 = fmul contract float %1873, %1874
  %1876 = fadd contract float %1871, %1875
  store float %1876, float addrspace(3)* %42, align 4, !tbaa !5
  %1877 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 256), i32 %176
  %1878 = load float, float addrspace(3)* %1877, align 4, !tbaa !5
  %1879 = load float, float addrspace(3)* %178, align 4, !tbaa !5
  %1880 = fmul contract float %1878, %1879
  %1881 = fadd contract float %1876, %1880
  store float %1881, float addrspace(3)* %42, align 4, !tbaa !5
  %1882 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 256), i32 %179
  %1883 = load float, float addrspace(3)* %1882, align 4, !tbaa !5
  %1884 = load float, float addrspace(3)* %181, align 4, !tbaa !5
  %1885 = fmul contract float %1883, %1884
  %1886 = fadd contract float %1881, %1885
  store float %1886, float addrspace(3)* %42, align 4, !tbaa !5
  %1887 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 256), i32 %182
  %1888 = load float, float addrspace(3)* %1887, align 4, !tbaa !5
  %1889 = load float, float addrspace(3)* %184, align 4, !tbaa !5
  %1890 = fmul contract float %1888, %1889
  %1891 = fadd contract float %1886, %1890
  store float %1891, float addrspace(3)* %42, align 4, !tbaa !5
  %1892 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 256), i32 %185
  %1893 = load float, float addrspace(3)* %1892, align 4, !tbaa !5
  %1894 = load float, float addrspace(3)* %187, align 4, !tbaa !5
  %1895 = fmul contract float %1893, %1894
  %1896 = fadd contract float %1891, %1895
  store float %1896, float addrspace(3)* %42, align 4, !tbaa !5
  %1897 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 256), i32 %188
  %1898 = load float, float addrspace(3)* %1897, align 4, !tbaa !5
  %1899 = load float, float addrspace(3)* %190, align 4, !tbaa !5
  %1900 = fmul contract float %1898, %1899
  %1901 = fadd contract float %1896, %1900
  store float %1901, float addrspace(3)* %42, align 4, !tbaa !5
  %1902 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 256), i32 %191
  %1903 = load float, float addrspace(3)* %1902, align 4, !tbaa !5
  %1904 = load float, float addrspace(3)* %193, align 4, !tbaa !5
  %1905 = fmul contract float %1903, %1904
  %1906 = fadd contract float %1901, %1905
  store float %1906, float addrspace(3)* %42, align 4, !tbaa !5
  %1907 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 256), i32 %194
  %1908 = load float, float addrspace(3)* %1907, align 4, !tbaa !5
  %1909 = load float, float addrspace(3)* %196, align 4, !tbaa !5
  %1910 = fmul contract float %1908, %1909
  %1911 = fadd contract float %1906, %1910
  store float %1911, float addrspace(3)* %42, align 4, !tbaa !5
  %1912 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 256), i32 %197
  %1913 = load float, float addrspace(3)* %1912, align 4, !tbaa !5
  %1914 = load float, float addrspace(3)* %199, align 4, !tbaa !5
  %1915 = fmul contract float %1913, %1914
  %1916 = fadd contract float %1911, %1915
  store float %1916, float addrspace(3)* %42, align 4, !tbaa !5
  %1917 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 256), i32 %200
  %1918 = load float, float addrspace(3)* %1917, align 4, !tbaa !5
  %1919 = load float, float addrspace(3)* %202, align 4, !tbaa !5
  %1920 = fmul contract float %1918, %1919
  %1921 = fadd contract float %1916, %1920
  store float %1921, float addrspace(3)* %42, align 4, !tbaa !5
  %1922 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 256), i32 %203
  %1923 = load float, float addrspace(3)* %1922, align 4, !tbaa !5
  %1924 = load float, float addrspace(3)* %205, align 4, !tbaa !5
  %1925 = fmul contract float %1923, %1924
  %1926 = fadd contract float %1921, %1925
  store float %1926, float addrspace(3)* %42, align 4, !tbaa !5
  %1927 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 256), i32 %206
  %1928 = load float, float addrspace(3)* %1927, align 4, !tbaa !5
  %1929 = load float, float addrspace(3)* %208, align 4, !tbaa !5
  %1930 = fmul contract float %1928, %1929
  %1931 = fadd contract float %1926, %1930
  store float %1931, float addrspace(3)* %42, align 4, !tbaa !5
  %1932 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 256), i32 %209
  %1933 = load float, float addrspace(3)* %1932, align 4, !tbaa !5
  %1934 = load float, float addrspace(3)* %211, align 4, !tbaa !5
  %1935 = fmul contract float %1933, %1934
  %1936 = fadd contract float %1931, %1935
  store float %1936, float addrspace(3)* %42, align 4, !tbaa !5
  %1937 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 256), i32 %212
  %1938 = load float, float addrspace(3)* %1937, align 4, !tbaa !5
  %1939 = load float, float addrspace(3)* %214, align 4, !tbaa !5
  %1940 = fmul contract float %1938, %1939
  %1941 = fadd contract float %1936, %1940
  store float %1941, float addrspace(3)* %42, align 4, !tbaa !5
  %1942 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 256), i32 %215
  %1943 = load float, float addrspace(3)* %1942, align 4, !tbaa !5
  %1944 = load float, float addrspace(3)* %217, align 4, !tbaa !5
  %1945 = fmul contract float %1943, %1944
  %1946 = fadd contract float %1941, %1945
  store float %1946, float addrspace(3)* %42, align 4, !tbaa !5
  %1947 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 256), i32 %218
  %1948 = load float, float addrspace(3)* %1947, align 4, !tbaa !5
  %1949 = load float, float addrspace(3)* %220, align 4, !tbaa !5
  %1950 = fmul contract float %1948, %1949
  %1951 = fadd contract float %1946, %1950
  store float %1951, float addrspace(3)* %42, align 4, !tbaa !5
  %1952 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 256), i32 %221
  %1953 = load float, float addrspace(3)* %1952, align 4, !tbaa !5
  %1954 = load float, float addrspace(3)* %223, align 4, !tbaa !5
  %1955 = fmul contract float %1953, %1954
  %1956 = fadd contract float %1951, %1955
  store float %1956, float addrspace(3)* %42, align 4, !tbaa !5
  %1957 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 256), i32 %224
  %1958 = load float, float addrspace(3)* %1957, align 4, !tbaa !5
  %1959 = load float, float addrspace(3)* %226, align 4, !tbaa !5
  %1960 = fmul contract float %1958, %1959
  %1961 = fadd contract float %1956, %1960
  store float %1961, float addrspace(3)* %42, align 4, !tbaa !5
  %1962 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 256), i32 %227
  %1963 = load float, float addrspace(3)* %1962, align 4, !tbaa !5
  %1964 = load float, float addrspace(3)* %229, align 4, !tbaa !5
  %1965 = fmul contract float %1963, %1964
  %1966 = fadd contract float %1961, %1965
  store float %1966, float addrspace(3)* %42, align 4, !tbaa !5
  %1967 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 256), i32 %230
  %1968 = load float, float addrspace(3)* %1967, align 4, !tbaa !5
  %1969 = load float, float addrspace(3)* %232, align 4, !tbaa !5
  %1970 = fmul contract float %1968, %1969
  %1971 = fadd contract float %1966, %1970
  store float %1971, float addrspace(3)* %42, align 4, !tbaa !5
  %1972 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 256), i32 %233
  %1973 = load float, float addrspace(3)* %1972, align 4, !tbaa !5
  %1974 = load float, float addrspace(3)* %235, align 4, !tbaa !5
  %1975 = fmul contract float %1973, %1974
  %1976 = fadd contract float %1971, %1975
  store float %1976, float addrspace(3)* %42, align 4, !tbaa !5
  %1977 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 256), i32 %236
  %1978 = load float, float addrspace(3)* %1977, align 4, !tbaa !5
  %1979 = load float, float addrspace(3)* %238, align 4, !tbaa !5
  %1980 = fmul contract float %1978, %1979
  %1981 = fadd contract float %1976, %1980
  store float %1981, float addrspace(3)* %42, align 4, !tbaa !5
  %1982 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 256), i32 %239
  %1983 = load float, float addrspace(3)* %1982, align 4, !tbaa !5
  %1984 = load float, float addrspace(3)* %241, align 4, !tbaa !5
  %1985 = fmul contract float %1983, %1984
  %1986 = fadd contract float %1981, %1985
  store float %1986, float addrspace(3)* %42, align 4, !tbaa !5
  %1987 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 256), i32 %242
  %1988 = load float, float addrspace(3)* %1987, align 4, !tbaa !5
  %1989 = load float, float addrspace(3)* %244, align 4, !tbaa !5
  %1990 = fmul contract float %1988, %1989
  %1991 = fadd contract float %1986, %1990
  store float %1991, float addrspace(3)* %42, align 4, !tbaa !5
  %1992 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 256), i32 %245
  %1993 = load float, float addrspace(3)* %1992, align 4, !tbaa !5
  %1994 = load float, float addrspace(3)* %247, align 4, !tbaa !5
  %1995 = fmul contract float %1993, %1994
  %1996 = fadd contract float %1991, %1995
  store float %1996, float addrspace(3)* %42, align 4, !tbaa !5
  %1997 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 256), i32 %248
  %1998 = load float, float addrspace(3)* %1997, align 4, !tbaa !5
  %1999 = load float, float addrspace(3)* %250, align 4, !tbaa !5
  %2000 = fmul contract float %1998, %1999
  %2001 = fadd contract float %1996, %2000
  store float %2001, float addrspace(3)* %42, align 4, !tbaa !5
  %2002 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 256), i32 %251
  %2003 = load float, float addrspace(3)* %2002, align 4, !tbaa !5
  %2004 = load float, float addrspace(3)* %253, align 4, !tbaa !5
  %2005 = fmul contract float %2003, %2004
  %2006 = fadd contract float %2001, %2005
  store float %2006, float addrspace(3)* %42, align 4, !tbaa !5
  %2007 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 256), i32 %254
  %2008 = load float, float addrspace(3)* %2007, align 4, !tbaa !5
  %2009 = load float, float addrspace(3)* %256, align 4, !tbaa !5
  %2010 = fmul contract float %2008, %2009
  %2011 = fadd contract float %2006, %2010
  store float %2011, float addrspace(3)* %42, align 4, !tbaa !5
  %2012 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 256), i32 %257
  %2013 = load float, float addrspace(3)* %2012, align 4, !tbaa !5
  %2014 = load float, float addrspace(3)* %259, align 4, !tbaa !5
  %2015 = fmul contract float %2013, %2014
  %2016 = fadd contract float %2011, %2015
  store float %2016, float addrspace(3)* %42, align 4, !tbaa !5
  %2017 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 256), i32 %260
  %2018 = load float, float addrspace(3)* %2017, align 4, !tbaa !5
  %2019 = load float, float addrspace(3)* %262, align 4, !tbaa !5
  %2020 = fmul contract float %2018, %2019
  %2021 = fadd contract float %2016, %2020
  store float %2021, float addrspace(3)* %42, align 4, !tbaa !5
  %2022 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 256), i32 %263
  %2023 = load float, float addrspace(3)* %2022, align 4, !tbaa !5
  %2024 = load float, float addrspace(3)* %265, align 4, !tbaa !5
  %2025 = fmul contract float %2023, %2024
  %2026 = fadd contract float %2021, %2025
  store float %2026, float addrspace(3)* %42, align 4, !tbaa !5
  %2027 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 256), i32 %266
  %2028 = load float, float addrspace(3)* %2027, align 4, !tbaa !5
  %2029 = load float, float addrspace(3)* %268, align 4, !tbaa !5
  %2030 = fmul contract float %2028, %2029
  %2031 = fadd contract float %2026, %2030
  store float %2031, float addrspace(3)* %42, align 4, !tbaa !5
  %2032 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 256), i32 %269
  %2033 = load float, float addrspace(3)* %2032, align 4, !tbaa !5
  %2034 = load float, float addrspace(3)* %271, align 4, !tbaa !5
  %2035 = fmul contract float %2033, %2034
  %2036 = fadd contract float %2031, %2035
  store float %2036, float addrspace(3)* %42, align 4, !tbaa !5
  %2037 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 256), i32 %272
  %2038 = load float, float addrspace(3)* %2037, align 4, !tbaa !5
  %2039 = load float, float addrspace(3)* %274, align 4, !tbaa !5
  %2040 = fmul contract float %2038, %2039
  %2041 = fadd contract float %2036, %2040
  store float %2041, float addrspace(3)* %42, align 4, !tbaa !5
  %2042 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 256), i32 %275
  %2043 = load float, float addrspace(3)* %2042, align 4, !tbaa !5
  %2044 = load float, float addrspace(3)* %277, align 4, !tbaa !5
  %2045 = fmul contract float %2043, %2044
  %2046 = fadd contract float %2041, %2045
  store float %2046, float addrspace(3)* %42, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %2047 = getelementptr inbounds float, float addrspace(1)* %1, i64 40960
  %2048 = getelementptr inbounds float, float addrspace(1)* %2047, i64 %44
  %2049 = load float, float addrspace(1)* %2048, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %2049, float addrspace(3)* %45, align 4, !tbaa !5
  %2050 = getelementptr inbounds float, float addrspace(1)* %2047, i64 %46
  %2051 = load float, float addrspace(1)* %2050, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %2051, float addrspace(3)* %47, align 4, !tbaa !5
  %2052 = getelementptr inbounds float, float addrspace(1)* %2047, i64 %48
  %2053 = load float, float addrspace(1)* %2052, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %2053, float addrspace(3)* %49, align 4, !tbaa !5
  %2054 = getelementptr inbounds float, float addrspace(1)* %2047, i64 %50
  %2055 = load float, float addrspace(1)* %2054, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %2055, float addrspace(3)* %51, align 4, !tbaa !5
  %2056 = getelementptr inbounds float, float addrspace(1)* %2047, i64 %53
  %2057 = load float, float addrspace(1)* %2056, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %2057, float addrspace(3)* %54, align 4, !tbaa !5
  %2058 = getelementptr inbounds float, float addrspace(1)* %2047, i64 %56
  %2059 = load float, float addrspace(1)* %2058, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %2059, float addrspace(3)* %57, align 4, !tbaa !5
  %2060 = getelementptr inbounds float, float addrspace(1)* %2047, i64 %59
  %2061 = load float, float addrspace(1)* %2060, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %2061, float addrspace(3)* %60, align 4, !tbaa !5
  %2062 = getelementptr inbounds float, float addrspace(1)* %2047, i64 %62
  %2063 = load float, float addrspace(1)* %2062, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %2063, float addrspace(3)* %63, align 4, !tbaa !5
  %2064 = getelementptr inbounds float, float addrspace(1)* %2047, i64 %65
  %2065 = load float, float addrspace(1)* %2064, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %2065, float addrspace(3)* %66, align 4, !tbaa !5
  %2066 = getelementptr inbounds float, float addrspace(1)* %2047, i64 %68
  %2067 = load float, float addrspace(1)* %2066, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %2067, float addrspace(3)* %69, align 4, !tbaa !5
  %2068 = getelementptr inbounds float, float addrspace(1)* %2047, i64 %71
  %2069 = load float, float addrspace(1)* %2068, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %2069, float addrspace(3)* %72, align 4, !tbaa !5
  %2070 = getelementptr inbounds float, float addrspace(1)* %2047, i64 %74
  %2071 = load float, float addrspace(1)* %2070, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %2071, float addrspace(3)* %75, align 4, !tbaa !5
  %2072 = getelementptr inbounds float, float addrspace(1)* %2047, i64 %77
  %2073 = load float, float addrspace(1)* %2072, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %2073, float addrspace(3)* %78, align 4, !tbaa !5
  %2074 = getelementptr inbounds float, float addrspace(1)* %2047, i64 %80
  %2075 = load float, float addrspace(1)* %2074, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %2075, float addrspace(3)* %81, align 4, !tbaa !5
  %2076 = getelementptr inbounds float, float addrspace(1)* %2047, i64 %83
  %2077 = load float, float addrspace(1)* %2076, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %2077, float addrspace(3)* %84, align 4, !tbaa !5
  %2078 = getelementptr inbounds float, float addrspace(1)* %2047, i64 %86
  %2079 = load float, float addrspace(1)* %2078, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %2079, float addrspace(3)* %87, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %2080 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 320), i32 %43
  %2081 = load float, float addrspace(3)* %2080, align 4, !tbaa !5
  %2082 = load float, float addrspace(3)* %88, align 4, !tbaa !5
  %2083 = fmul contract float %2081, %2082
  %2084 = load float, float addrspace(3)* %42, align 4, !tbaa !5
  %2085 = fadd contract float %2084, %2083
  store float %2085, float addrspace(3)* %42, align 4, !tbaa !5
  %2086 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 320), i32 %89
  %2087 = load float, float addrspace(3)* %2086, align 4, !tbaa !5
  %2088 = load float, float addrspace(3)* %91, align 4, !tbaa !5
  %2089 = fmul contract float %2087, %2088
  %2090 = fadd contract float %2085, %2089
  store float %2090, float addrspace(3)* %42, align 4, !tbaa !5
  %2091 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 320), i32 %92
  %2092 = load float, float addrspace(3)* %2091, align 4, !tbaa !5
  %2093 = load float, float addrspace(3)* %94, align 4, !tbaa !5
  %2094 = fmul contract float %2092, %2093
  %2095 = fadd contract float %2090, %2094
  store float %2095, float addrspace(3)* %42, align 4, !tbaa !5
  %2096 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 320), i32 %95
  %2097 = load float, float addrspace(3)* %2096, align 4, !tbaa !5
  %2098 = load float, float addrspace(3)* %97, align 4, !tbaa !5
  %2099 = fmul contract float %2097, %2098
  %2100 = fadd contract float %2095, %2099
  store float %2100, float addrspace(3)* %42, align 4, !tbaa !5
  %2101 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 320), i32 %98
  %2102 = load float, float addrspace(3)* %2101, align 4, !tbaa !5
  %2103 = load float, float addrspace(3)* %100, align 4, !tbaa !5
  %2104 = fmul contract float %2102, %2103
  %2105 = fadd contract float %2100, %2104
  store float %2105, float addrspace(3)* %42, align 4, !tbaa !5
  %2106 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 320), i32 %101
  %2107 = load float, float addrspace(3)* %2106, align 4, !tbaa !5
  %2108 = load float, float addrspace(3)* %103, align 4, !tbaa !5
  %2109 = fmul contract float %2107, %2108
  %2110 = fadd contract float %2105, %2109
  store float %2110, float addrspace(3)* %42, align 4, !tbaa !5
  %2111 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 320), i32 %104
  %2112 = load float, float addrspace(3)* %2111, align 4, !tbaa !5
  %2113 = load float, float addrspace(3)* %106, align 4, !tbaa !5
  %2114 = fmul contract float %2112, %2113
  %2115 = fadd contract float %2110, %2114
  store float %2115, float addrspace(3)* %42, align 4, !tbaa !5
  %2116 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 320), i32 %107
  %2117 = load float, float addrspace(3)* %2116, align 4, !tbaa !5
  %2118 = load float, float addrspace(3)* %109, align 4, !tbaa !5
  %2119 = fmul contract float %2117, %2118
  %2120 = fadd contract float %2115, %2119
  store float %2120, float addrspace(3)* %42, align 4, !tbaa !5
  %2121 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 320), i32 %110
  %2122 = load float, float addrspace(3)* %2121, align 4, !tbaa !5
  %2123 = load float, float addrspace(3)* %112, align 4, !tbaa !5
  %2124 = fmul contract float %2122, %2123
  %2125 = fadd contract float %2120, %2124
  store float %2125, float addrspace(3)* %42, align 4, !tbaa !5
  %2126 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 320), i32 %113
  %2127 = load float, float addrspace(3)* %2126, align 4, !tbaa !5
  %2128 = load float, float addrspace(3)* %115, align 4, !tbaa !5
  %2129 = fmul contract float %2127, %2128
  %2130 = fadd contract float %2125, %2129
  store float %2130, float addrspace(3)* %42, align 4, !tbaa !5
  %2131 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 320), i32 %116
  %2132 = load float, float addrspace(3)* %2131, align 4, !tbaa !5
  %2133 = load float, float addrspace(3)* %118, align 4, !tbaa !5
  %2134 = fmul contract float %2132, %2133
  %2135 = fadd contract float %2130, %2134
  store float %2135, float addrspace(3)* %42, align 4, !tbaa !5
  %2136 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 320), i32 %119
  %2137 = load float, float addrspace(3)* %2136, align 4, !tbaa !5
  %2138 = load float, float addrspace(3)* %121, align 4, !tbaa !5
  %2139 = fmul contract float %2137, %2138
  %2140 = fadd contract float %2135, %2139
  store float %2140, float addrspace(3)* %42, align 4, !tbaa !5
  %2141 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 320), i32 %122
  %2142 = load float, float addrspace(3)* %2141, align 4, !tbaa !5
  %2143 = load float, float addrspace(3)* %124, align 4, !tbaa !5
  %2144 = fmul contract float %2142, %2143
  %2145 = fadd contract float %2140, %2144
  store float %2145, float addrspace(3)* %42, align 4, !tbaa !5
  %2146 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 320), i32 %125
  %2147 = load float, float addrspace(3)* %2146, align 4, !tbaa !5
  %2148 = load float, float addrspace(3)* %127, align 4, !tbaa !5
  %2149 = fmul contract float %2147, %2148
  %2150 = fadd contract float %2145, %2149
  store float %2150, float addrspace(3)* %42, align 4, !tbaa !5
  %2151 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 320), i32 %128
  %2152 = load float, float addrspace(3)* %2151, align 4, !tbaa !5
  %2153 = load float, float addrspace(3)* %130, align 4, !tbaa !5
  %2154 = fmul contract float %2152, %2153
  %2155 = fadd contract float %2150, %2154
  store float %2155, float addrspace(3)* %42, align 4, !tbaa !5
  %2156 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 320), i32 %131
  %2157 = load float, float addrspace(3)* %2156, align 4, !tbaa !5
  %2158 = load float, float addrspace(3)* %133, align 4, !tbaa !5
  %2159 = fmul contract float %2157, %2158
  %2160 = fadd contract float %2155, %2159
  store float %2160, float addrspace(3)* %42, align 4, !tbaa !5
  %2161 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 320), i32 %134
  %2162 = load float, float addrspace(3)* %2161, align 4, !tbaa !5
  %2163 = load float, float addrspace(3)* %136, align 4, !tbaa !5
  %2164 = fmul contract float %2162, %2163
  %2165 = fadd contract float %2160, %2164
  store float %2165, float addrspace(3)* %42, align 4, !tbaa !5
  %2166 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 320), i32 %137
  %2167 = load float, float addrspace(3)* %2166, align 4, !tbaa !5
  %2168 = load float, float addrspace(3)* %139, align 4, !tbaa !5
  %2169 = fmul contract float %2167, %2168
  %2170 = fadd contract float %2165, %2169
  store float %2170, float addrspace(3)* %42, align 4, !tbaa !5
  %2171 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 320), i32 %140
  %2172 = load float, float addrspace(3)* %2171, align 4, !tbaa !5
  %2173 = load float, float addrspace(3)* %142, align 4, !tbaa !5
  %2174 = fmul contract float %2172, %2173
  %2175 = fadd contract float %2170, %2174
  store float %2175, float addrspace(3)* %42, align 4, !tbaa !5
  %2176 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 320), i32 %143
  %2177 = load float, float addrspace(3)* %2176, align 4, !tbaa !5
  %2178 = load float, float addrspace(3)* %145, align 4, !tbaa !5
  %2179 = fmul contract float %2177, %2178
  %2180 = fadd contract float %2175, %2179
  store float %2180, float addrspace(3)* %42, align 4, !tbaa !5
  %2181 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 320), i32 %146
  %2182 = load float, float addrspace(3)* %2181, align 4, !tbaa !5
  %2183 = load float, float addrspace(3)* %148, align 4, !tbaa !5
  %2184 = fmul contract float %2182, %2183
  %2185 = fadd contract float %2180, %2184
  store float %2185, float addrspace(3)* %42, align 4, !tbaa !5
  %2186 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 320), i32 %149
  %2187 = load float, float addrspace(3)* %2186, align 4, !tbaa !5
  %2188 = load float, float addrspace(3)* %151, align 4, !tbaa !5
  %2189 = fmul contract float %2187, %2188
  %2190 = fadd contract float %2185, %2189
  store float %2190, float addrspace(3)* %42, align 4, !tbaa !5
  %2191 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 320), i32 %152
  %2192 = load float, float addrspace(3)* %2191, align 4, !tbaa !5
  %2193 = load float, float addrspace(3)* %154, align 4, !tbaa !5
  %2194 = fmul contract float %2192, %2193
  %2195 = fadd contract float %2190, %2194
  store float %2195, float addrspace(3)* %42, align 4, !tbaa !5
  %2196 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 320), i32 %155
  %2197 = load float, float addrspace(3)* %2196, align 4, !tbaa !5
  %2198 = load float, float addrspace(3)* %157, align 4, !tbaa !5
  %2199 = fmul contract float %2197, %2198
  %2200 = fadd contract float %2195, %2199
  store float %2200, float addrspace(3)* %42, align 4, !tbaa !5
  %2201 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 320), i32 %158
  %2202 = load float, float addrspace(3)* %2201, align 4, !tbaa !5
  %2203 = load float, float addrspace(3)* %160, align 4, !tbaa !5
  %2204 = fmul contract float %2202, %2203
  %2205 = fadd contract float %2200, %2204
  store float %2205, float addrspace(3)* %42, align 4, !tbaa !5
  %2206 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 320), i32 %161
  %2207 = load float, float addrspace(3)* %2206, align 4, !tbaa !5
  %2208 = load float, float addrspace(3)* %163, align 4, !tbaa !5
  %2209 = fmul contract float %2207, %2208
  %2210 = fadd contract float %2205, %2209
  store float %2210, float addrspace(3)* %42, align 4, !tbaa !5
  %2211 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 320), i32 %164
  %2212 = load float, float addrspace(3)* %2211, align 4, !tbaa !5
  %2213 = load float, float addrspace(3)* %166, align 4, !tbaa !5
  %2214 = fmul contract float %2212, %2213
  %2215 = fadd contract float %2210, %2214
  store float %2215, float addrspace(3)* %42, align 4, !tbaa !5
  %2216 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 320), i32 %167
  %2217 = load float, float addrspace(3)* %2216, align 4, !tbaa !5
  %2218 = load float, float addrspace(3)* %169, align 4, !tbaa !5
  %2219 = fmul contract float %2217, %2218
  %2220 = fadd contract float %2215, %2219
  store float %2220, float addrspace(3)* %42, align 4, !tbaa !5
  %2221 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 320), i32 %170
  %2222 = load float, float addrspace(3)* %2221, align 4, !tbaa !5
  %2223 = load float, float addrspace(3)* %172, align 4, !tbaa !5
  %2224 = fmul contract float %2222, %2223
  %2225 = fadd contract float %2220, %2224
  store float %2225, float addrspace(3)* %42, align 4, !tbaa !5
  %2226 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 320), i32 %173
  %2227 = load float, float addrspace(3)* %2226, align 4, !tbaa !5
  %2228 = load float, float addrspace(3)* %175, align 4, !tbaa !5
  %2229 = fmul contract float %2227, %2228
  %2230 = fadd contract float %2225, %2229
  store float %2230, float addrspace(3)* %42, align 4, !tbaa !5
  %2231 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 320), i32 %176
  %2232 = load float, float addrspace(3)* %2231, align 4, !tbaa !5
  %2233 = load float, float addrspace(3)* %178, align 4, !tbaa !5
  %2234 = fmul contract float %2232, %2233
  %2235 = fadd contract float %2230, %2234
  store float %2235, float addrspace(3)* %42, align 4, !tbaa !5
  %2236 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 320), i32 %179
  %2237 = load float, float addrspace(3)* %2236, align 4, !tbaa !5
  %2238 = load float, float addrspace(3)* %181, align 4, !tbaa !5
  %2239 = fmul contract float %2237, %2238
  %2240 = fadd contract float %2235, %2239
  store float %2240, float addrspace(3)* %42, align 4, !tbaa !5
  %2241 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 320), i32 %182
  %2242 = load float, float addrspace(3)* %2241, align 4, !tbaa !5
  %2243 = load float, float addrspace(3)* %184, align 4, !tbaa !5
  %2244 = fmul contract float %2242, %2243
  %2245 = fadd contract float %2240, %2244
  store float %2245, float addrspace(3)* %42, align 4, !tbaa !5
  %2246 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 320), i32 %185
  %2247 = load float, float addrspace(3)* %2246, align 4, !tbaa !5
  %2248 = load float, float addrspace(3)* %187, align 4, !tbaa !5
  %2249 = fmul contract float %2247, %2248
  %2250 = fadd contract float %2245, %2249
  store float %2250, float addrspace(3)* %42, align 4, !tbaa !5
  %2251 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 320), i32 %188
  %2252 = load float, float addrspace(3)* %2251, align 4, !tbaa !5
  %2253 = load float, float addrspace(3)* %190, align 4, !tbaa !5
  %2254 = fmul contract float %2252, %2253
  %2255 = fadd contract float %2250, %2254
  store float %2255, float addrspace(3)* %42, align 4, !tbaa !5
  %2256 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 320), i32 %191
  %2257 = load float, float addrspace(3)* %2256, align 4, !tbaa !5
  %2258 = load float, float addrspace(3)* %193, align 4, !tbaa !5
  %2259 = fmul contract float %2257, %2258
  %2260 = fadd contract float %2255, %2259
  store float %2260, float addrspace(3)* %42, align 4, !tbaa !5
  %2261 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 320), i32 %194
  %2262 = load float, float addrspace(3)* %2261, align 4, !tbaa !5
  %2263 = load float, float addrspace(3)* %196, align 4, !tbaa !5
  %2264 = fmul contract float %2262, %2263
  %2265 = fadd contract float %2260, %2264
  store float %2265, float addrspace(3)* %42, align 4, !tbaa !5
  %2266 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 320), i32 %197
  %2267 = load float, float addrspace(3)* %2266, align 4, !tbaa !5
  %2268 = load float, float addrspace(3)* %199, align 4, !tbaa !5
  %2269 = fmul contract float %2267, %2268
  %2270 = fadd contract float %2265, %2269
  store float %2270, float addrspace(3)* %42, align 4, !tbaa !5
  %2271 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 320), i32 %200
  %2272 = load float, float addrspace(3)* %2271, align 4, !tbaa !5
  %2273 = load float, float addrspace(3)* %202, align 4, !tbaa !5
  %2274 = fmul contract float %2272, %2273
  %2275 = fadd contract float %2270, %2274
  store float %2275, float addrspace(3)* %42, align 4, !tbaa !5
  %2276 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 320), i32 %203
  %2277 = load float, float addrspace(3)* %2276, align 4, !tbaa !5
  %2278 = load float, float addrspace(3)* %205, align 4, !tbaa !5
  %2279 = fmul contract float %2277, %2278
  %2280 = fadd contract float %2275, %2279
  store float %2280, float addrspace(3)* %42, align 4, !tbaa !5
  %2281 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 320), i32 %206
  %2282 = load float, float addrspace(3)* %2281, align 4, !tbaa !5
  %2283 = load float, float addrspace(3)* %208, align 4, !tbaa !5
  %2284 = fmul contract float %2282, %2283
  %2285 = fadd contract float %2280, %2284
  store float %2285, float addrspace(3)* %42, align 4, !tbaa !5
  %2286 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 320), i32 %209
  %2287 = load float, float addrspace(3)* %2286, align 4, !tbaa !5
  %2288 = load float, float addrspace(3)* %211, align 4, !tbaa !5
  %2289 = fmul contract float %2287, %2288
  %2290 = fadd contract float %2285, %2289
  store float %2290, float addrspace(3)* %42, align 4, !tbaa !5
  %2291 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 320), i32 %212
  %2292 = load float, float addrspace(3)* %2291, align 4, !tbaa !5
  %2293 = load float, float addrspace(3)* %214, align 4, !tbaa !5
  %2294 = fmul contract float %2292, %2293
  %2295 = fadd contract float %2290, %2294
  store float %2295, float addrspace(3)* %42, align 4, !tbaa !5
  %2296 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 320), i32 %215
  %2297 = load float, float addrspace(3)* %2296, align 4, !tbaa !5
  %2298 = load float, float addrspace(3)* %217, align 4, !tbaa !5
  %2299 = fmul contract float %2297, %2298
  %2300 = fadd contract float %2295, %2299
  store float %2300, float addrspace(3)* %42, align 4, !tbaa !5
  %2301 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 320), i32 %218
  %2302 = load float, float addrspace(3)* %2301, align 4, !tbaa !5
  %2303 = load float, float addrspace(3)* %220, align 4, !tbaa !5
  %2304 = fmul contract float %2302, %2303
  %2305 = fadd contract float %2300, %2304
  store float %2305, float addrspace(3)* %42, align 4, !tbaa !5
  %2306 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 320), i32 %221
  %2307 = load float, float addrspace(3)* %2306, align 4, !tbaa !5
  %2308 = load float, float addrspace(3)* %223, align 4, !tbaa !5
  %2309 = fmul contract float %2307, %2308
  %2310 = fadd contract float %2305, %2309
  store float %2310, float addrspace(3)* %42, align 4, !tbaa !5
  %2311 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 320), i32 %224
  %2312 = load float, float addrspace(3)* %2311, align 4, !tbaa !5
  %2313 = load float, float addrspace(3)* %226, align 4, !tbaa !5
  %2314 = fmul contract float %2312, %2313
  %2315 = fadd contract float %2310, %2314
  store float %2315, float addrspace(3)* %42, align 4, !tbaa !5
  %2316 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 320), i32 %227
  %2317 = load float, float addrspace(3)* %2316, align 4, !tbaa !5
  %2318 = load float, float addrspace(3)* %229, align 4, !tbaa !5
  %2319 = fmul contract float %2317, %2318
  %2320 = fadd contract float %2315, %2319
  store float %2320, float addrspace(3)* %42, align 4, !tbaa !5
  %2321 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 320), i32 %230
  %2322 = load float, float addrspace(3)* %2321, align 4, !tbaa !5
  %2323 = load float, float addrspace(3)* %232, align 4, !tbaa !5
  %2324 = fmul contract float %2322, %2323
  %2325 = fadd contract float %2320, %2324
  store float %2325, float addrspace(3)* %42, align 4, !tbaa !5
  %2326 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 320), i32 %233
  %2327 = load float, float addrspace(3)* %2326, align 4, !tbaa !5
  %2328 = load float, float addrspace(3)* %235, align 4, !tbaa !5
  %2329 = fmul contract float %2327, %2328
  %2330 = fadd contract float %2325, %2329
  store float %2330, float addrspace(3)* %42, align 4, !tbaa !5
  %2331 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 320), i32 %236
  %2332 = load float, float addrspace(3)* %2331, align 4, !tbaa !5
  %2333 = load float, float addrspace(3)* %238, align 4, !tbaa !5
  %2334 = fmul contract float %2332, %2333
  %2335 = fadd contract float %2330, %2334
  store float %2335, float addrspace(3)* %42, align 4, !tbaa !5
  %2336 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 320), i32 %239
  %2337 = load float, float addrspace(3)* %2336, align 4, !tbaa !5
  %2338 = load float, float addrspace(3)* %241, align 4, !tbaa !5
  %2339 = fmul contract float %2337, %2338
  %2340 = fadd contract float %2335, %2339
  store float %2340, float addrspace(3)* %42, align 4, !tbaa !5
  %2341 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 320), i32 %242
  %2342 = load float, float addrspace(3)* %2341, align 4, !tbaa !5
  %2343 = load float, float addrspace(3)* %244, align 4, !tbaa !5
  %2344 = fmul contract float %2342, %2343
  %2345 = fadd contract float %2340, %2344
  store float %2345, float addrspace(3)* %42, align 4, !tbaa !5
  %2346 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 320), i32 %245
  %2347 = load float, float addrspace(3)* %2346, align 4, !tbaa !5
  %2348 = load float, float addrspace(3)* %247, align 4, !tbaa !5
  %2349 = fmul contract float %2347, %2348
  %2350 = fadd contract float %2345, %2349
  store float %2350, float addrspace(3)* %42, align 4, !tbaa !5
  %2351 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 320), i32 %248
  %2352 = load float, float addrspace(3)* %2351, align 4, !tbaa !5
  %2353 = load float, float addrspace(3)* %250, align 4, !tbaa !5
  %2354 = fmul contract float %2352, %2353
  %2355 = fadd contract float %2350, %2354
  store float %2355, float addrspace(3)* %42, align 4, !tbaa !5
  %2356 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 320), i32 %251
  %2357 = load float, float addrspace(3)* %2356, align 4, !tbaa !5
  %2358 = load float, float addrspace(3)* %253, align 4, !tbaa !5
  %2359 = fmul contract float %2357, %2358
  %2360 = fadd contract float %2355, %2359
  store float %2360, float addrspace(3)* %42, align 4, !tbaa !5
  %2361 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 320), i32 %254
  %2362 = load float, float addrspace(3)* %2361, align 4, !tbaa !5
  %2363 = load float, float addrspace(3)* %256, align 4, !tbaa !5
  %2364 = fmul contract float %2362, %2363
  %2365 = fadd contract float %2360, %2364
  store float %2365, float addrspace(3)* %42, align 4, !tbaa !5
  %2366 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 320), i32 %257
  %2367 = load float, float addrspace(3)* %2366, align 4, !tbaa !5
  %2368 = load float, float addrspace(3)* %259, align 4, !tbaa !5
  %2369 = fmul contract float %2367, %2368
  %2370 = fadd contract float %2365, %2369
  store float %2370, float addrspace(3)* %42, align 4, !tbaa !5
  %2371 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 320), i32 %260
  %2372 = load float, float addrspace(3)* %2371, align 4, !tbaa !5
  %2373 = load float, float addrspace(3)* %262, align 4, !tbaa !5
  %2374 = fmul contract float %2372, %2373
  %2375 = fadd contract float %2370, %2374
  store float %2375, float addrspace(3)* %42, align 4, !tbaa !5
  %2376 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 320), i32 %263
  %2377 = load float, float addrspace(3)* %2376, align 4, !tbaa !5
  %2378 = load float, float addrspace(3)* %265, align 4, !tbaa !5
  %2379 = fmul contract float %2377, %2378
  %2380 = fadd contract float %2375, %2379
  store float %2380, float addrspace(3)* %42, align 4, !tbaa !5
  %2381 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 320), i32 %266
  %2382 = load float, float addrspace(3)* %2381, align 4, !tbaa !5
  %2383 = load float, float addrspace(3)* %268, align 4, !tbaa !5
  %2384 = fmul contract float %2382, %2383
  %2385 = fadd contract float %2380, %2384
  store float %2385, float addrspace(3)* %42, align 4, !tbaa !5
  %2386 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 320), i32 %269
  %2387 = load float, float addrspace(3)* %2386, align 4, !tbaa !5
  %2388 = load float, float addrspace(3)* %271, align 4, !tbaa !5
  %2389 = fmul contract float %2387, %2388
  %2390 = fadd contract float %2385, %2389
  store float %2390, float addrspace(3)* %42, align 4, !tbaa !5
  %2391 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 320), i32 %272
  %2392 = load float, float addrspace(3)* %2391, align 4, !tbaa !5
  %2393 = load float, float addrspace(3)* %274, align 4, !tbaa !5
  %2394 = fmul contract float %2392, %2393
  %2395 = fadd contract float %2390, %2394
  store float %2395, float addrspace(3)* %42, align 4, !tbaa !5
  %2396 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 320), i32 %275
  %2397 = load float, float addrspace(3)* %2396, align 4, !tbaa !5
  %2398 = load float, float addrspace(3)* %277, align 4, !tbaa !5
  %2399 = fmul contract float %2397, %2398
  %2400 = fadd contract float %2395, %2399
  store float %2400, float addrspace(3)* %42, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %2401 = getelementptr inbounds float, float addrspace(1)* %1, i64 49152
  %2402 = getelementptr inbounds float, float addrspace(1)* %2401, i64 %44
  %2403 = load float, float addrspace(1)* %2402, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %2403, float addrspace(3)* %45, align 4, !tbaa !5
  %2404 = getelementptr inbounds float, float addrspace(1)* %2401, i64 %46
  %2405 = load float, float addrspace(1)* %2404, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %2405, float addrspace(3)* %47, align 4, !tbaa !5
  %2406 = getelementptr inbounds float, float addrspace(1)* %2401, i64 %48
  %2407 = load float, float addrspace(1)* %2406, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %2407, float addrspace(3)* %49, align 4, !tbaa !5
  %2408 = getelementptr inbounds float, float addrspace(1)* %2401, i64 %50
  %2409 = load float, float addrspace(1)* %2408, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %2409, float addrspace(3)* %51, align 4, !tbaa !5
  %2410 = getelementptr inbounds float, float addrspace(1)* %2401, i64 %53
  %2411 = load float, float addrspace(1)* %2410, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %2411, float addrspace(3)* %54, align 4, !tbaa !5
  %2412 = getelementptr inbounds float, float addrspace(1)* %2401, i64 %56
  %2413 = load float, float addrspace(1)* %2412, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %2413, float addrspace(3)* %57, align 4, !tbaa !5
  %2414 = getelementptr inbounds float, float addrspace(1)* %2401, i64 %59
  %2415 = load float, float addrspace(1)* %2414, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %2415, float addrspace(3)* %60, align 4, !tbaa !5
  %2416 = getelementptr inbounds float, float addrspace(1)* %2401, i64 %62
  %2417 = load float, float addrspace(1)* %2416, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %2417, float addrspace(3)* %63, align 4, !tbaa !5
  %2418 = getelementptr inbounds float, float addrspace(1)* %2401, i64 %65
  %2419 = load float, float addrspace(1)* %2418, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %2419, float addrspace(3)* %66, align 4, !tbaa !5
  %2420 = getelementptr inbounds float, float addrspace(1)* %2401, i64 %68
  %2421 = load float, float addrspace(1)* %2420, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %2421, float addrspace(3)* %69, align 4, !tbaa !5
  %2422 = getelementptr inbounds float, float addrspace(1)* %2401, i64 %71
  %2423 = load float, float addrspace(1)* %2422, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %2423, float addrspace(3)* %72, align 4, !tbaa !5
  %2424 = getelementptr inbounds float, float addrspace(1)* %2401, i64 %74
  %2425 = load float, float addrspace(1)* %2424, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %2425, float addrspace(3)* %75, align 4, !tbaa !5
  %2426 = getelementptr inbounds float, float addrspace(1)* %2401, i64 %77
  %2427 = load float, float addrspace(1)* %2426, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %2427, float addrspace(3)* %78, align 4, !tbaa !5
  %2428 = getelementptr inbounds float, float addrspace(1)* %2401, i64 %80
  %2429 = load float, float addrspace(1)* %2428, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %2429, float addrspace(3)* %81, align 4, !tbaa !5
  %2430 = getelementptr inbounds float, float addrspace(1)* %2401, i64 %83
  %2431 = load float, float addrspace(1)* %2430, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %2431, float addrspace(3)* %84, align 4, !tbaa !5
  %2432 = getelementptr inbounds float, float addrspace(1)* %2401, i64 %86
  %2433 = load float, float addrspace(1)* %2432, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %2433, float addrspace(3)* %87, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %2434 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 384), i32 %43
  %2435 = load float, float addrspace(3)* %2434, align 4, !tbaa !5
  %2436 = load float, float addrspace(3)* %88, align 4, !tbaa !5
  %2437 = fmul contract float %2435, %2436
  %2438 = load float, float addrspace(3)* %42, align 4, !tbaa !5
  %2439 = fadd contract float %2438, %2437
  store float %2439, float addrspace(3)* %42, align 4, !tbaa !5
  %2440 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 384), i32 %89
  %2441 = load float, float addrspace(3)* %2440, align 4, !tbaa !5
  %2442 = load float, float addrspace(3)* %91, align 4, !tbaa !5
  %2443 = fmul contract float %2441, %2442
  %2444 = fadd contract float %2439, %2443
  store float %2444, float addrspace(3)* %42, align 4, !tbaa !5
  %2445 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 384), i32 %92
  %2446 = load float, float addrspace(3)* %2445, align 4, !tbaa !5
  %2447 = load float, float addrspace(3)* %94, align 4, !tbaa !5
  %2448 = fmul contract float %2446, %2447
  %2449 = fadd contract float %2444, %2448
  store float %2449, float addrspace(3)* %42, align 4, !tbaa !5
  %2450 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 384), i32 %95
  %2451 = load float, float addrspace(3)* %2450, align 4, !tbaa !5
  %2452 = load float, float addrspace(3)* %97, align 4, !tbaa !5
  %2453 = fmul contract float %2451, %2452
  %2454 = fadd contract float %2449, %2453
  store float %2454, float addrspace(3)* %42, align 4, !tbaa !5
  %2455 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 384), i32 %98
  %2456 = load float, float addrspace(3)* %2455, align 4, !tbaa !5
  %2457 = load float, float addrspace(3)* %100, align 4, !tbaa !5
  %2458 = fmul contract float %2456, %2457
  %2459 = fadd contract float %2454, %2458
  store float %2459, float addrspace(3)* %42, align 4, !tbaa !5
  %2460 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 384), i32 %101
  %2461 = load float, float addrspace(3)* %2460, align 4, !tbaa !5
  %2462 = load float, float addrspace(3)* %103, align 4, !tbaa !5
  %2463 = fmul contract float %2461, %2462
  %2464 = fadd contract float %2459, %2463
  store float %2464, float addrspace(3)* %42, align 4, !tbaa !5
  %2465 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 384), i32 %104
  %2466 = load float, float addrspace(3)* %2465, align 4, !tbaa !5
  %2467 = load float, float addrspace(3)* %106, align 4, !tbaa !5
  %2468 = fmul contract float %2466, %2467
  %2469 = fadd contract float %2464, %2468
  store float %2469, float addrspace(3)* %42, align 4, !tbaa !5
  %2470 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 384), i32 %107
  %2471 = load float, float addrspace(3)* %2470, align 4, !tbaa !5
  %2472 = load float, float addrspace(3)* %109, align 4, !tbaa !5
  %2473 = fmul contract float %2471, %2472
  %2474 = fadd contract float %2469, %2473
  store float %2474, float addrspace(3)* %42, align 4, !tbaa !5
  %2475 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 384), i32 %110
  %2476 = load float, float addrspace(3)* %2475, align 4, !tbaa !5
  %2477 = load float, float addrspace(3)* %112, align 4, !tbaa !5
  %2478 = fmul contract float %2476, %2477
  %2479 = fadd contract float %2474, %2478
  store float %2479, float addrspace(3)* %42, align 4, !tbaa !5
  %2480 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 384), i32 %113
  %2481 = load float, float addrspace(3)* %2480, align 4, !tbaa !5
  %2482 = load float, float addrspace(3)* %115, align 4, !tbaa !5
  %2483 = fmul contract float %2481, %2482
  %2484 = fadd contract float %2479, %2483
  store float %2484, float addrspace(3)* %42, align 4, !tbaa !5
  %2485 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 384), i32 %116
  %2486 = load float, float addrspace(3)* %2485, align 4, !tbaa !5
  %2487 = load float, float addrspace(3)* %118, align 4, !tbaa !5
  %2488 = fmul contract float %2486, %2487
  %2489 = fadd contract float %2484, %2488
  store float %2489, float addrspace(3)* %42, align 4, !tbaa !5
  %2490 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 384), i32 %119
  %2491 = load float, float addrspace(3)* %2490, align 4, !tbaa !5
  %2492 = load float, float addrspace(3)* %121, align 4, !tbaa !5
  %2493 = fmul contract float %2491, %2492
  %2494 = fadd contract float %2489, %2493
  store float %2494, float addrspace(3)* %42, align 4, !tbaa !5
  %2495 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 384), i32 %122
  %2496 = load float, float addrspace(3)* %2495, align 4, !tbaa !5
  %2497 = load float, float addrspace(3)* %124, align 4, !tbaa !5
  %2498 = fmul contract float %2496, %2497
  %2499 = fadd contract float %2494, %2498
  store float %2499, float addrspace(3)* %42, align 4, !tbaa !5
  %2500 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 384), i32 %125
  %2501 = load float, float addrspace(3)* %2500, align 4, !tbaa !5
  %2502 = load float, float addrspace(3)* %127, align 4, !tbaa !5
  %2503 = fmul contract float %2501, %2502
  %2504 = fadd contract float %2499, %2503
  store float %2504, float addrspace(3)* %42, align 4, !tbaa !5
  %2505 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 384), i32 %128
  %2506 = load float, float addrspace(3)* %2505, align 4, !tbaa !5
  %2507 = load float, float addrspace(3)* %130, align 4, !tbaa !5
  %2508 = fmul contract float %2506, %2507
  %2509 = fadd contract float %2504, %2508
  store float %2509, float addrspace(3)* %42, align 4, !tbaa !5
  %2510 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 384), i32 %131
  %2511 = load float, float addrspace(3)* %2510, align 4, !tbaa !5
  %2512 = load float, float addrspace(3)* %133, align 4, !tbaa !5
  %2513 = fmul contract float %2511, %2512
  %2514 = fadd contract float %2509, %2513
  store float %2514, float addrspace(3)* %42, align 4, !tbaa !5
  %2515 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 384), i32 %134
  %2516 = load float, float addrspace(3)* %2515, align 4, !tbaa !5
  %2517 = load float, float addrspace(3)* %136, align 4, !tbaa !5
  %2518 = fmul contract float %2516, %2517
  %2519 = fadd contract float %2514, %2518
  store float %2519, float addrspace(3)* %42, align 4, !tbaa !5
  %2520 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 384), i32 %137
  %2521 = load float, float addrspace(3)* %2520, align 4, !tbaa !5
  %2522 = load float, float addrspace(3)* %139, align 4, !tbaa !5
  %2523 = fmul contract float %2521, %2522
  %2524 = fadd contract float %2519, %2523
  store float %2524, float addrspace(3)* %42, align 4, !tbaa !5
  %2525 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 384), i32 %140
  %2526 = load float, float addrspace(3)* %2525, align 4, !tbaa !5
  %2527 = load float, float addrspace(3)* %142, align 4, !tbaa !5
  %2528 = fmul contract float %2526, %2527
  %2529 = fadd contract float %2524, %2528
  store float %2529, float addrspace(3)* %42, align 4, !tbaa !5
  %2530 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 384), i32 %143
  %2531 = load float, float addrspace(3)* %2530, align 4, !tbaa !5
  %2532 = load float, float addrspace(3)* %145, align 4, !tbaa !5
  %2533 = fmul contract float %2531, %2532
  %2534 = fadd contract float %2529, %2533
  store float %2534, float addrspace(3)* %42, align 4, !tbaa !5
  %2535 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 384), i32 %146
  %2536 = load float, float addrspace(3)* %2535, align 4, !tbaa !5
  %2537 = load float, float addrspace(3)* %148, align 4, !tbaa !5
  %2538 = fmul contract float %2536, %2537
  %2539 = fadd contract float %2534, %2538
  store float %2539, float addrspace(3)* %42, align 4, !tbaa !5
  %2540 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 384), i32 %149
  %2541 = load float, float addrspace(3)* %2540, align 4, !tbaa !5
  %2542 = load float, float addrspace(3)* %151, align 4, !tbaa !5
  %2543 = fmul contract float %2541, %2542
  %2544 = fadd contract float %2539, %2543
  store float %2544, float addrspace(3)* %42, align 4, !tbaa !5
  %2545 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 384), i32 %152
  %2546 = load float, float addrspace(3)* %2545, align 4, !tbaa !5
  %2547 = load float, float addrspace(3)* %154, align 4, !tbaa !5
  %2548 = fmul contract float %2546, %2547
  %2549 = fadd contract float %2544, %2548
  store float %2549, float addrspace(3)* %42, align 4, !tbaa !5
  %2550 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 384), i32 %155
  %2551 = load float, float addrspace(3)* %2550, align 4, !tbaa !5
  %2552 = load float, float addrspace(3)* %157, align 4, !tbaa !5
  %2553 = fmul contract float %2551, %2552
  %2554 = fadd contract float %2549, %2553
  store float %2554, float addrspace(3)* %42, align 4, !tbaa !5
  %2555 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 384), i32 %158
  %2556 = load float, float addrspace(3)* %2555, align 4, !tbaa !5
  %2557 = load float, float addrspace(3)* %160, align 4, !tbaa !5
  %2558 = fmul contract float %2556, %2557
  %2559 = fadd contract float %2554, %2558
  store float %2559, float addrspace(3)* %42, align 4, !tbaa !5
  %2560 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 384), i32 %161
  %2561 = load float, float addrspace(3)* %2560, align 4, !tbaa !5
  %2562 = load float, float addrspace(3)* %163, align 4, !tbaa !5
  %2563 = fmul contract float %2561, %2562
  %2564 = fadd contract float %2559, %2563
  store float %2564, float addrspace(3)* %42, align 4, !tbaa !5
  %2565 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 384), i32 %164
  %2566 = load float, float addrspace(3)* %2565, align 4, !tbaa !5
  %2567 = load float, float addrspace(3)* %166, align 4, !tbaa !5
  %2568 = fmul contract float %2566, %2567
  %2569 = fadd contract float %2564, %2568
  store float %2569, float addrspace(3)* %42, align 4, !tbaa !5
  %2570 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 384), i32 %167
  %2571 = load float, float addrspace(3)* %2570, align 4, !tbaa !5
  %2572 = load float, float addrspace(3)* %169, align 4, !tbaa !5
  %2573 = fmul contract float %2571, %2572
  %2574 = fadd contract float %2569, %2573
  store float %2574, float addrspace(3)* %42, align 4, !tbaa !5
  %2575 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 384), i32 %170
  %2576 = load float, float addrspace(3)* %2575, align 4, !tbaa !5
  %2577 = load float, float addrspace(3)* %172, align 4, !tbaa !5
  %2578 = fmul contract float %2576, %2577
  %2579 = fadd contract float %2574, %2578
  store float %2579, float addrspace(3)* %42, align 4, !tbaa !5
  %2580 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 384), i32 %173
  %2581 = load float, float addrspace(3)* %2580, align 4, !tbaa !5
  %2582 = load float, float addrspace(3)* %175, align 4, !tbaa !5
  %2583 = fmul contract float %2581, %2582
  %2584 = fadd contract float %2579, %2583
  store float %2584, float addrspace(3)* %42, align 4, !tbaa !5
  %2585 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 384), i32 %176
  %2586 = load float, float addrspace(3)* %2585, align 4, !tbaa !5
  %2587 = load float, float addrspace(3)* %178, align 4, !tbaa !5
  %2588 = fmul contract float %2586, %2587
  %2589 = fadd contract float %2584, %2588
  store float %2589, float addrspace(3)* %42, align 4, !tbaa !5
  %2590 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 384), i32 %179
  %2591 = load float, float addrspace(3)* %2590, align 4, !tbaa !5
  %2592 = load float, float addrspace(3)* %181, align 4, !tbaa !5
  %2593 = fmul contract float %2591, %2592
  %2594 = fadd contract float %2589, %2593
  store float %2594, float addrspace(3)* %42, align 4, !tbaa !5
  %2595 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 384), i32 %182
  %2596 = load float, float addrspace(3)* %2595, align 4, !tbaa !5
  %2597 = load float, float addrspace(3)* %184, align 4, !tbaa !5
  %2598 = fmul contract float %2596, %2597
  %2599 = fadd contract float %2594, %2598
  store float %2599, float addrspace(3)* %42, align 4, !tbaa !5
  %2600 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 384), i32 %185
  %2601 = load float, float addrspace(3)* %2600, align 4, !tbaa !5
  %2602 = load float, float addrspace(3)* %187, align 4, !tbaa !5
  %2603 = fmul contract float %2601, %2602
  %2604 = fadd contract float %2599, %2603
  store float %2604, float addrspace(3)* %42, align 4, !tbaa !5
  %2605 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 384), i32 %188
  %2606 = load float, float addrspace(3)* %2605, align 4, !tbaa !5
  %2607 = load float, float addrspace(3)* %190, align 4, !tbaa !5
  %2608 = fmul contract float %2606, %2607
  %2609 = fadd contract float %2604, %2608
  store float %2609, float addrspace(3)* %42, align 4, !tbaa !5
  %2610 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 384), i32 %191
  %2611 = load float, float addrspace(3)* %2610, align 4, !tbaa !5
  %2612 = load float, float addrspace(3)* %193, align 4, !tbaa !5
  %2613 = fmul contract float %2611, %2612
  %2614 = fadd contract float %2609, %2613
  store float %2614, float addrspace(3)* %42, align 4, !tbaa !5
  %2615 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 384), i32 %194
  %2616 = load float, float addrspace(3)* %2615, align 4, !tbaa !5
  %2617 = load float, float addrspace(3)* %196, align 4, !tbaa !5
  %2618 = fmul contract float %2616, %2617
  %2619 = fadd contract float %2614, %2618
  store float %2619, float addrspace(3)* %42, align 4, !tbaa !5
  %2620 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 384), i32 %197
  %2621 = load float, float addrspace(3)* %2620, align 4, !tbaa !5
  %2622 = load float, float addrspace(3)* %199, align 4, !tbaa !5
  %2623 = fmul contract float %2621, %2622
  %2624 = fadd contract float %2619, %2623
  store float %2624, float addrspace(3)* %42, align 4, !tbaa !5
  %2625 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 384), i32 %200
  %2626 = load float, float addrspace(3)* %2625, align 4, !tbaa !5
  %2627 = load float, float addrspace(3)* %202, align 4, !tbaa !5
  %2628 = fmul contract float %2626, %2627
  %2629 = fadd contract float %2624, %2628
  store float %2629, float addrspace(3)* %42, align 4, !tbaa !5
  %2630 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 384), i32 %203
  %2631 = load float, float addrspace(3)* %2630, align 4, !tbaa !5
  %2632 = load float, float addrspace(3)* %205, align 4, !tbaa !5
  %2633 = fmul contract float %2631, %2632
  %2634 = fadd contract float %2629, %2633
  store float %2634, float addrspace(3)* %42, align 4, !tbaa !5
  %2635 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 384), i32 %206
  %2636 = load float, float addrspace(3)* %2635, align 4, !tbaa !5
  %2637 = load float, float addrspace(3)* %208, align 4, !tbaa !5
  %2638 = fmul contract float %2636, %2637
  %2639 = fadd contract float %2634, %2638
  store float %2639, float addrspace(3)* %42, align 4, !tbaa !5
  %2640 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 384), i32 %209
  %2641 = load float, float addrspace(3)* %2640, align 4, !tbaa !5
  %2642 = load float, float addrspace(3)* %211, align 4, !tbaa !5
  %2643 = fmul contract float %2641, %2642
  %2644 = fadd contract float %2639, %2643
  store float %2644, float addrspace(3)* %42, align 4, !tbaa !5
  %2645 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 384), i32 %212
  %2646 = load float, float addrspace(3)* %2645, align 4, !tbaa !5
  %2647 = load float, float addrspace(3)* %214, align 4, !tbaa !5
  %2648 = fmul contract float %2646, %2647
  %2649 = fadd contract float %2644, %2648
  store float %2649, float addrspace(3)* %42, align 4, !tbaa !5
  %2650 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 384), i32 %215
  %2651 = load float, float addrspace(3)* %2650, align 4, !tbaa !5
  %2652 = load float, float addrspace(3)* %217, align 4, !tbaa !5
  %2653 = fmul contract float %2651, %2652
  %2654 = fadd contract float %2649, %2653
  store float %2654, float addrspace(3)* %42, align 4, !tbaa !5
  %2655 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 384), i32 %218
  %2656 = load float, float addrspace(3)* %2655, align 4, !tbaa !5
  %2657 = load float, float addrspace(3)* %220, align 4, !tbaa !5
  %2658 = fmul contract float %2656, %2657
  %2659 = fadd contract float %2654, %2658
  store float %2659, float addrspace(3)* %42, align 4, !tbaa !5
  %2660 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 384), i32 %221
  %2661 = load float, float addrspace(3)* %2660, align 4, !tbaa !5
  %2662 = load float, float addrspace(3)* %223, align 4, !tbaa !5
  %2663 = fmul contract float %2661, %2662
  %2664 = fadd contract float %2659, %2663
  store float %2664, float addrspace(3)* %42, align 4, !tbaa !5
  %2665 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 384), i32 %224
  %2666 = load float, float addrspace(3)* %2665, align 4, !tbaa !5
  %2667 = load float, float addrspace(3)* %226, align 4, !tbaa !5
  %2668 = fmul contract float %2666, %2667
  %2669 = fadd contract float %2664, %2668
  store float %2669, float addrspace(3)* %42, align 4, !tbaa !5
  %2670 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 384), i32 %227
  %2671 = load float, float addrspace(3)* %2670, align 4, !tbaa !5
  %2672 = load float, float addrspace(3)* %229, align 4, !tbaa !5
  %2673 = fmul contract float %2671, %2672
  %2674 = fadd contract float %2669, %2673
  store float %2674, float addrspace(3)* %42, align 4, !tbaa !5
  %2675 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 384), i32 %230
  %2676 = load float, float addrspace(3)* %2675, align 4, !tbaa !5
  %2677 = load float, float addrspace(3)* %232, align 4, !tbaa !5
  %2678 = fmul contract float %2676, %2677
  %2679 = fadd contract float %2674, %2678
  store float %2679, float addrspace(3)* %42, align 4, !tbaa !5
  %2680 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 384), i32 %233
  %2681 = load float, float addrspace(3)* %2680, align 4, !tbaa !5
  %2682 = load float, float addrspace(3)* %235, align 4, !tbaa !5
  %2683 = fmul contract float %2681, %2682
  %2684 = fadd contract float %2679, %2683
  store float %2684, float addrspace(3)* %42, align 4, !tbaa !5
  %2685 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 384), i32 %236
  %2686 = load float, float addrspace(3)* %2685, align 4, !tbaa !5
  %2687 = load float, float addrspace(3)* %238, align 4, !tbaa !5
  %2688 = fmul contract float %2686, %2687
  %2689 = fadd contract float %2684, %2688
  store float %2689, float addrspace(3)* %42, align 4, !tbaa !5
  %2690 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 384), i32 %239
  %2691 = load float, float addrspace(3)* %2690, align 4, !tbaa !5
  %2692 = load float, float addrspace(3)* %241, align 4, !tbaa !5
  %2693 = fmul contract float %2691, %2692
  %2694 = fadd contract float %2689, %2693
  store float %2694, float addrspace(3)* %42, align 4, !tbaa !5
  %2695 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 384), i32 %242
  %2696 = load float, float addrspace(3)* %2695, align 4, !tbaa !5
  %2697 = load float, float addrspace(3)* %244, align 4, !tbaa !5
  %2698 = fmul contract float %2696, %2697
  %2699 = fadd contract float %2694, %2698
  store float %2699, float addrspace(3)* %42, align 4, !tbaa !5
  %2700 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 384), i32 %245
  %2701 = load float, float addrspace(3)* %2700, align 4, !tbaa !5
  %2702 = load float, float addrspace(3)* %247, align 4, !tbaa !5
  %2703 = fmul contract float %2701, %2702
  %2704 = fadd contract float %2699, %2703
  store float %2704, float addrspace(3)* %42, align 4, !tbaa !5
  %2705 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 384), i32 %248
  %2706 = load float, float addrspace(3)* %2705, align 4, !tbaa !5
  %2707 = load float, float addrspace(3)* %250, align 4, !tbaa !5
  %2708 = fmul contract float %2706, %2707
  %2709 = fadd contract float %2704, %2708
  store float %2709, float addrspace(3)* %42, align 4, !tbaa !5
  %2710 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 384), i32 %251
  %2711 = load float, float addrspace(3)* %2710, align 4, !tbaa !5
  %2712 = load float, float addrspace(3)* %253, align 4, !tbaa !5
  %2713 = fmul contract float %2711, %2712
  %2714 = fadd contract float %2709, %2713
  store float %2714, float addrspace(3)* %42, align 4, !tbaa !5
  %2715 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 384), i32 %254
  %2716 = load float, float addrspace(3)* %2715, align 4, !tbaa !5
  %2717 = load float, float addrspace(3)* %256, align 4, !tbaa !5
  %2718 = fmul contract float %2716, %2717
  %2719 = fadd contract float %2714, %2718
  store float %2719, float addrspace(3)* %42, align 4, !tbaa !5
  %2720 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 384), i32 %257
  %2721 = load float, float addrspace(3)* %2720, align 4, !tbaa !5
  %2722 = load float, float addrspace(3)* %259, align 4, !tbaa !5
  %2723 = fmul contract float %2721, %2722
  %2724 = fadd contract float %2719, %2723
  store float %2724, float addrspace(3)* %42, align 4, !tbaa !5
  %2725 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 384), i32 %260
  %2726 = load float, float addrspace(3)* %2725, align 4, !tbaa !5
  %2727 = load float, float addrspace(3)* %262, align 4, !tbaa !5
  %2728 = fmul contract float %2726, %2727
  %2729 = fadd contract float %2724, %2728
  store float %2729, float addrspace(3)* %42, align 4, !tbaa !5
  %2730 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 384), i32 %263
  %2731 = load float, float addrspace(3)* %2730, align 4, !tbaa !5
  %2732 = load float, float addrspace(3)* %265, align 4, !tbaa !5
  %2733 = fmul contract float %2731, %2732
  %2734 = fadd contract float %2729, %2733
  store float %2734, float addrspace(3)* %42, align 4, !tbaa !5
  %2735 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 384), i32 %266
  %2736 = load float, float addrspace(3)* %2735, align 4, !tbaa !5
  %2737 = load float, float addrspace(3)* %268, align 4, !tbaa !5
  %2738 = fmul contract float %2736, %2737
  %2739 = fadd contract float %2734, %2738
  store float %2739, float addrspace(3)* %42, align 4, !tbaa !5
  %2740 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 384), i32 %269
  %2741 = load float, float addrspace(3)* %2740, align 4, !tbaa !5
  %2742 = load float, float addrspace(3)* %271, align 4, !tbaa !5
  %2743 = fmul contract float %2741, %2742
  %2744 = fadd contract float %2739, %2743
  store float %2744, float addrspace(3)* %42, align 4, !tbaa !5
  %2745 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 384), i32 %272
  %2746 = load float, float addrspace(3)* %2745, align 4, !tbaa !5
  %2747 = load float, float addrspace(3)* %274, align 4, !tbaa !5
  %2748 = fmul contract float %2746, %2747
  %2749 = fadd contract float %2744, %2748
  store float %2749, float addrspace(3)* %42, align 4, !tbaa !5
  %2750 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 384), i32 %275
  %2751 = load float, float addrspace(3)* %2750, align 4, !tbaa !5
  %2752 = load float, float addrspace(3)* %277, align 4, !tbaa !5
  %2753 = fmul contract float %2751, %2752
  %2754 = fadd contract float %2749, %2753
  store float %2754, float addrspace(3)* %42, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %2755 = getelementptr inbounds float, float addrspace(1)* %1, i64 57344
  %2756 = getelementptr inbounds float, float addrspace(1)* %2755, i64 %44
  %2757 = load float, float addrspace(1)* %2756, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %2757, float addrspace(3)* %45, align 4, !tbaa !5
  %2758 = getelementptr inbounds float, float addrspace(1)* %2755, i64 %46
  %2759 = load float, float addrspace(1)* %2758, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %2759, float addrspace(3)* %47, align 4, !tbaa !5
  %2760 = getelementptr inbounds float, float addrspace(1)* %2755, i64 %48
  %2761 = load float, float addrspace(1)* %2760, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %2761, float addrspace(3)* %49, align 4, !tbaa !5
  %2762 = getelementptr inbounds float, float addrspace(1)* %2755, i64 %50
  %2763 = load float, float addrspace(1)* %2762, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %2763, float addrspace(3)* %51, align 4, !tbaa !5
  %2764 = getelementptr inbounds float, float addrspace(1)* %2755, i64 %53
  %2765 = load float, float addrspace(1)* %2764, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %2765, float addrspace(3)* %54, align 4, !tbaa !5
  %2766 = getelementptr inbounds float, float addrspace(1)* %2755, i64 %56
  %2767 = load float, float addrspace(1)* %2766, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %2767, float addrspace(3)* %57, align 4, !tbaa !5
  %2768 = getelementptr inbounds float, float addrspace(1)* %2755, i64 %59
  %2769 = load float, float addrspace(1)* %2768, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %2769, float addrspace(3)* %60, align 4, !tbaa !5
  %2770 = getelementptr inbounds float, float addrspace(1)* %2755, i64 %62
  %2771 = load float, float addrspace(1)* %2770, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %2771, float addrspace(3)* %63, align 4, !tbaa !5
  %2772 = getelementptr inbounds float, float addrspace(1)* %2755, i64 %65
  %2773 = load float, float addrspace(1)* %2772, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %2773, float addrspace(3)* %66, align 4, !tbaa !5
  %2774 = getelementptr inbounds float, float addrspace(1)* %2755, i64 %68
  %2775 = load float, float addrspace(1)* %2774, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %2775, float addrspace(3)* %69, align 4, !tbaa !5
  %2776 = getelementptr inbounds float, float addrspace(1)* %2755, i64 %71
  %2777 = load float, float addrspace(1)* %2776, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %2777, float addrspace(3)* %72, align 4, !tbaa !5
  %2778 = getelementptr inbounds float, float addrspace(1)* %2755, i64 %74
  %2779 = load float, float addrspace(1)* %2778, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %2779, float addrspace(3)* %75, align 4, !tbaa !5
  %2780 = getelementptr inbounds float, float addrspace(1)* %2755, i64 %77
  %2781 = load float, float addrspace(1)* %2780, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %2781, float addrspace(3)* %78, align 4, !tbaa !5
  %2782 = getelementptr inbounds float, float addrspace(1)* %2755, i64 %80
  %2783 = load float, float addrspace(1)* %2782, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %2783, float addrspace(3)* %81, align 4, !tbaa !5
  %2784 = getelementptr inbounds float, float addrspace(1)* %2755, i64 %83
  %2785 = load float, float addrspace(1)* %2784, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %2785, float addrspace(3)* %84, align 4, !tbaa !5
  %2786 = getelementptr inbounds float, float addrspace(1)* %2755, i64 %86
  %2787 = load float, float addrspace(1)* %2786, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %2787, float addrspace(3)* %87, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %2788 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 448), i32 %43
  %2789 = load float, float addrspace(3)* %2788, align 4, !tbaa !5
  %2790 = load float, float addrspace(3)* %88, align 4, !tbaa !5
  %2791 = fmul contract float %2789, %2790
  %2792 = load float, float addrspace(3)* %42, align 4, !tbaa !5
  %2793 = fadd contract float %2792, %2791
  store float %2793, float addrspace(3)* %42, align 4, !tbaa !5
  %2794 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 448), i32 %89
  %2795 = load float, float addrspace(3)* %2794, align 4, !tbaa !5
  %2796 = load float, float addrspace(3)* %91, align 4, !tbaa !5
  %2797 = fmul contract float %2795, %2796
  %2798 = fadd contract float %2793, %2797
  store float %2798, float addrspace(3)* %42, align 4, !tbaa !5
  %2799 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 448), i32 %92
  %2800 = load float, float addrspace(3)* %2799, align 4, !tbaa !5
  %2801 = load float, float addrspace(3)* %94, align 4, !tbaa !5
  %2802 = fmul contract float %2800, %2801
  %2803 = fadd contract float %2798, %2802
  store float %2803, float addrspace(3)* %42, align 4, !tbaa !5
  %2804 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 448), i32 %95
  %2805 = load float, float addrspace(3)* %2804, align 4, !tbaa !5
  %2806 = load float, float addrspace(3)* %97, align 4, !tbaa !5
  %2807 = fmul contract float %2805, %2806
  %2808 = fadd contract float %2803, %2807
  store float %2808, float addrspace(3)* %42, align 4, !tbaa !5
  %2809 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 448), i32 %98
  %2810 = load float, float addrspace(3)* %2809, align 4, !tbaa !5
  %2811 = load float, float addrspace(3)* %100, align 4, !tbaa !5
  %2812 = fmul contract float %2810, %2811
  %2813 = fadd contract float %2808, %2812
  store float %2813, float addrspace(3)* %42, align 4, !tbaa !5
  %2814 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 448), i32 %101
  %2815 = load float, float addrspace(3)* %2814, align 4, !tbaa !5
  %2816 = load float, float addrspace(3)* %103, align 4, !tbaa !5
  %2817 = fmul contract float %2815, %2816
  %2818 = fadd contract float %2813, %2817
  store float %2818, float addrspace(3)* %42, align 4, !tbaa !5
  %2819 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 448), i32 %104
  %2820 = load float, float addrspace(3)* %2819, align 4, !tbaa !5
  %2821 = load float, float addrspace(3)* %106, align 4, !tbaa !5
  %2822 = fmul contract float %2820, %2821
  %2823 = fadd contract float %2818, %2822
  store float %2823, float addrspace(3)* %42, align 4, !tbaa !5
  %2824 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 448), i32 %107
  %2825 = load float, float addrspace(3)* %2824, align 4, !tbaa !5
  %2826 = load float, float addrspace(3)* %109, align 4, !tbaa !5
  %2827 = fmul contract float %2825, %2826
  %2828 = fadd contract float %2823, %2827
  store float %2828, float addrspace(3)* %42, align 4, !tbaa !5
  %2829 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 448), i32 %110
  %2830 = load float, float addrspace(3)* %2829, align 4, !tbaa !5
  %2831 = load float, float addrspace(3)* %112, align 4, !tbaa !5
  %2832 = fmul contract float %2830, %2831
  %2833 = fadd contract float %2828, %2832
  store float %2833, float addrspace(3)* %42, align 4, !tbaa !5
  %2834 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 448), i32 %113
  %2835 = load float, float addrspace(3)* %2834, align 4, !tbaa !5
  %2836 = load float, float addrspace(3)* %115, align 4, !tbaa !5
  %2837 = fmul contract float %2835, %2836
  %2838 = fadd contract float %2833, %2837
  store float %2838, float addrspace(3)* %42, align 4, !tbaa !5
  %2839 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 448), i32 %116
  %2840 = load float, float addrspace(3)* %2839, align 4, !tbaa !5
  %2841 = load float, float addrspace(3)* %118, align 4, !tbaa !5
  %2842 = fmul contract float %2840, %2841
  %2843 = fadd contract float %2838, %2842
  store float %2843, float addrspace(3)* %42, align 4, !tbaa !5
  %2844 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 448), i32 %119
  %2845 = load float, float addrspace(3)* %2844, align 4, !tbaa !5
  %2846 = load float, float addrspace(3)* %121, align 4, !tbaa !5
  %2847 = fmul contract float %2845, %2846
  %2848 = fadd contract float %2843, %2847
  store float %2848, float addrspace(3)* %42, align 4, !tbaa !5
  %2849 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 448), i32 %122
  %2850 = load float, float addrspace(3)* %2849, align 4, !tbaa !5
  %2851 = load float, float addrspace(3)* %124, align 4, !tbaa !5
  %2852 = fmul contract float %2850, %2851
  %2853 = fadd contract float %2848, %2852
  store float %2853, float addrspace(3)* %42, align 4, !tbaa !5
  %2854 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 448), i32 %125
  %2855 = load float, float addrspace(3)* %2854, align 4, !tbaa !5
  %2856 = load float, float addrspace(3)* %127, align 4, !tbaa !5
  %2857 = fmul contract float %2855, %2856
  %2858 = fadd contract float %2853, %2857
  store float %2858, float addrspace(3)* %42, align 4, !tbaa !5
  %2859 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 448), i32 %128
  %2860 = load float, float addrspace(3)* %2859, align 4, !tbaa !5
  %2861 = load float, float addrspace(3)* %130, align 4, !tbaa !5
  %2862 = fmul contract float %2860, %2861
  %2863 = fadd contract float %2858, %2862
  store float %2863, float addrspace(3)* %42, align 4, !tbaa !5
  %2864 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 448), i32 %131
  %2865 = load float, float addrspace(3)* %2864, align 4, !tbaa !5
  %2866 = load float, float addrspace(3)* %133, align 4, !tbaa !5
  %2867 = fmul contract float %2865, %2866
  %2868 = fadd contract float %2863, %2867
  store float %2868, float addrspace(3)* %42, align 4, !tbaa !5
  %2869 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 448), i32 %134
  %2870 = load float, float addrspace(3)* %2869, align 4, !tbaa !5
  %2871 = load float, float addrspace(3)* %136, align 4, !tbaa !5
  %2872 = fmul contract float %2870, %2871
  %2873 = fadd contract float %2868, %2872
  store float %2873, float addrspace(3)* %42, align 4, !tbaa !5
  %2874 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 448), i32 %137
  %2875 = load float, float addrspace(3)* %2874, align 4, !tbaa !5
  %2876 = load float, float addrspace(3)* %139, align 4, !tbaa !5
  %2877 = fmul contract float %2875, %2876
  %2878 = fadd contract float %2873, %2877
  store float %2878, float addrspace(3)* %42, align 4, !tbaa !5
  %2879 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 448), i32 %140
  %2880 = load float, float addrspace(3)* %2879, align 4, !tbaa !5
  %2881 = load float, float addrspace(3)* %142, align 4, !tbaa !5
  %2882 = fmul contract float %2880, %2881
  %2883 = fadd contract float %2878, %2882
  store float %2883, float addrspace(3)* %42, align 4, !tbaa !5
  %2884 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 448), i32 %143
  %2885 = load float, float addrspace(3)* %2884, align 4, !tbaa !5
  %2886 = load float, float addrspace(3)* %145, align 4, !tbaa !5
  %2887 = fmul contract float %2885, %2886
  %2888 = fadd contract float %2883, %2887
  store float %2888, float addrspace(3)* %42, align 4, !tbaa !5
  %2889 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 448), i32 %146
  %2890 = load float, float addrspace(3)* %2889, align 4, !tbaa !5
  %2891 = load float, float addrspace(3)* %148, align 4, !tbaa !5
  %2892 = fmul contract float %2890, %2891
  %2893 = fadd contract float %2888, %2892
  store float %2893, float addrspace(3)* %42, align 4, !tbaa !5
  %2894 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 448), i32 %149
  %2895 = load float, float addrspace(3)* %2894, align 4, !tbaa !5
  %2896 = load float, float addrspace(3)* %151, align 4, !tbaa !5
  %2897 = fmul contract float %2895, %2896
  %2898 = fadd contract float %2893, %2897
  store float %2898, float addrspace(3)* %42, align 4, !tbaa !5
  %2899 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 448), i32 %152
  %2900 = load float, float addrspace(3)* %2899, align 4, !tbaa !5
  %2901 = load float, float addrspace(3)* %154, align 4, !tbaa !5
  %2902 = fmul contract float %2900, %2901
  %2903 = fadd contract float %2898, %2902
  store float %2903, float addrspace(3)* %42, align 4, !tbaa !5
  %2904 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 448), i32 %155
  %2905 = load float, float addrspace(3)* %2904, align 4, !tbaa !5
  %2906 = load float, float addrspace(3)* %157, align 4, !tbaa !5
  %2907 = fmul contract float %2905, %2906
  %2908 = fadd contract float %2903, %2907
  store float %2908, float addrspace(3)* %42, align 4, !tbaa !5
  %2909 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 448), i32 %158
  %2910 = load float, float addrspace(3)* %2909, align 4, !tbaa !5
  %2911 = load float, float addrspace(3)* %160, align 4, !tbaa !5
  %2912 = fmul contract float %2910, %2911
  %2913 = fadd contract float %2908, %2912
  store float %2913, float addrspace(3)* %42, align 4, !tbaa !5
  %2914 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 448), i32 %161
  %2915 = load float, float addrspace(3)* %2914, align 4, !tbaa !5
  %2916 = load float, float addrspace(3)* %163, align 4, !tbaa !5
  %2917 = fmul contract float %2915, %2916
  %2918 = fadd contract float %2913, %2917
  store float %2918, float addrspace(3)* %42, align 4, !tbaa !5
  %2919 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 448), i32 %164
  %2920 = load float, float addrspace(3)* %2919, align 4, !tbaa !5
  %2921 = load float, float addrspace(3)* %166, align 4, !tbaa !5
  %2922 = fmul contract float %2920, %2921
  %2923 = fadd contract float %2918, %2922
  store float %2923, float addrspace(3)* %42, align 4, !tbaa !5
  %2924 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 448), i32 %167
  %2925 = load float, float addrspace(3)* %2924, align 4, !tbaa !5
  %2926 = load float, float addrspace(3)* %169, align 4, !tbaa !5
  %2927 = fmul contract float %2925, %2926
  %2928 = fadd contract float %2923, %2927
  store float %2928, float addrspace(3)* %42, align 4, !tbaa !5
  %2929 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 448), i32 %170
  %2930 = load float, float addrspace(3)* %2929, align 4, !tbaa !5
  %2931 = load float, float addrspace(3)* %172, align 4, !tbaa !5
  %2932 = fmul contract float %2930, %2931
  %2933 = fadd contract float %2928, %2932
  store float %2933, float addrspace(3)* %42, align 4, !tbaa !5
  %2934 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 448), i32 %173
  %2935 = load float, float addrspace(3)* %2934, align 4, !tbaa !5
  %2936 = load float, float addrspace(3)* %175, align 4, !tbaa !5
  %2937 = fmul contract float %2935, %2936
  %2938 = fadd contract float %2933, %2937
  store float %2938, float addrspace(3)* %42, align 4, !tbaa !5
  %2939 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 448), i32 %176
  %2940 = load float, float addrspace(3)* %2939, align 4, !tbaa !5
  %2941 = load float, float addrspace(3)* %178, align 4, !tbaa !5
  %2942 = fmul contract float %2940, %2941
  %2943 = fadd contract float %2938, %2942
  store float %2943, float addrspace(3)* %42, align 4, !tbaa !5
  %2944 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 448), i32 %179
  %2945 = load float, float addrspace(3)* %2944, align 4, !tbaa !5
  %2946 = load float, float addrspace(3)* %181, align 4, !tbaa !5
  %2947 = fmul contract float %2945, %2946
  %2948 = fadd contract float %2943, %2947
  store float %2948, float addrspace(3)* %42, align 4, !tbaa !5
  %2949 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 448), i32 %182
  %2950 = load float, float addrspace(3)* %2949, align 4, !tbaa !5
  %2951 = load float, float addrspace(3)* %184, align 4, !tbaa !5
  %2952 = fmul contract float %2950, %2951
  %2953 = fadd contract float %2948, %2952
  store float %2953, float addrspace(3)* %42, align 4, !tbaa !5
  %2954 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 448), i32 %185
  %2955 = load float, float addrspace(3)* %2954, align 4, !tbaa !5
  %2956 = load float, float addrspace(3)* %187, align 4, !tbaa !5
  %2957 = fmul contract float %2955, %2956
  %2958 = fadd contract float %2953, %2957
  store float %2958, float addrspace(3)* %42, align 4, !tbaa !5
  %2959 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 448), i32 %188
  %2960 = load float, float addrspace(3)* %2959, align 4, !tbaa !5
  %2961 = load float, float addrspace(3)* %190, align 4, !tbaa !5
  %2962 = fmul contract float %2960, %2961
  %2963 = fadd contract float %2958, %2962
  store float %2963, float addrspace(3)* %42, align 4, !tbaa !5
  %2964 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 448), i32 %191
  %2965 = load float, float addrspace(3)* %2964, align 4, !tbaa !5
  %2966 = load float, float addrspace(3)* %193, align 4, !tbaa !5
  %2967 = fmul contract float %2965, %2966
  %2968 = fadd contract float %2963, %2967
  store float %2968, float addrspace(3)* %42, align 4, !tbaa !5
  %2969 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 448), i32 %194
  %2970 = load float, float addrspace(3)* %2969, align 4, !tbaa !5
  %2971 = load float, float addrspace(3)* %196, align 4, !tbaa !5
  %2972 = fmul contract float %2970, %2971
  %2973 = fadd contract float %2968, %2972
  store float %2973, float addrspace(3)* %42, align 4, !tbaa !5
  %2974 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 448), i32 %197
  %2975 = load float, float addrspace(3)* %2974, align 4, !tbaa !5
  %2976 = load float, float addrspace(3)* %199, align 4, !tbaa !5
  %2977 = fmul contract float %2975, %2976
  %2978 = fadd contract float %2973, %2977
  store float %2978, float addrspace(3)* %42, align 4, !tbaa !5
  %2979 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 448), i32 %200
  %2980 = load float, float addrspace(3)* %2979, align 4, !tbaa !5
  %2981 = load float, float addrspace(3)* %202, align 4, !tbaa !5
  %2982 = fmul contract float %2980, %2981
  %2983 = fadd contract float %2978, %2982
  store float %2983, float addrspace(3)* %42, align 4, !tbaa !5
  %2984 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 448), i32 %203
  %2985 = load float, float addrspace(3)* %2984, align 4, !tbaa !5
  %2986 = load float, float addrspace(3)* %205, align 4, !tbaa !5
  %2987 = fmul contract float %2985, %2986
  %2988 = fadd contract float %2983, %2987
  store float %2988, float addrspace(3)* %42, align 4, !tbaa !5
  %2989 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 448), i32 %206
  %2990 = load float, float addrspace(3)* %2989, align 4, !tbaa !5
  %2991 = load float, float addrspace(3)* %208, align 4, !tbaa !5
  %2992 = fmul contract float %2990, %2991
  %2993 = fadd contract float %2988, %2992
  store float %2993, float addrspace(3)* %42, align 4, !tbaa !5
  %2994 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 448), i32 %209
  %2995 = load float, float addrspace(3)* %2994, align 4, !tbaa !5
  %2996 = load float, float addrspace(3)* %211, align 4, !tbaa !5
  %2997 = fmul contract float %2995, %2996
  %2998 = fadd contract float %2993, %2997
  store float %2998, float addrspace(3)* %42, align 4, !tbaa !5
  %2999 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 448), i32 %212
  %3000 = load float, float addrspace(3)* %2999, align 4, !tbaa !5
  %3001 = load float, float addrspace(3)* %214, align 4, !tbaa !5
  %3002 = fmul contract float %3000, %3001
  %3003 = fadd contract float %2998, %3002
  store float %3003, float addrspace(3)* %42, align 4, !tbaa !5
  %3004 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 448), i32 %215
  %3005 = load float, float addrspace(3)* %3004, align 4, !tbaa !5
  %3006 = load float, float addrspace(3)* %217, align 4, !tbaa !5
  %3007 = fmul contract float %3005, %3006
  %3008 = fadd contract float %3003, %3007
  store float %3008, float addrspace(3)* %42, align 4, !tbaa !5
  %3009 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 448), i32 %218
  %3010 = load float, float addrspace(3)* %3009, align 4, !tbaa !5
  %3011 = load float, float addrspace(3)* %220, align 4, !tbaa !5
  %3012 = fmul contract float %3010, %3011
  %3013 = fadd contract float %3008, %3012
  store float %3013, float addrspace(3)* %42, align 4, !tbaa !5
  %3014 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 448), i32 %221
  %3015 = load float, float addrspace(3)* %3014, align 4, !tbaa !5
  %3016 = load float, float addrspace(3)* %223, align 4, !tbaa !5
  %3017 = fmul contract float %3015, %3016
  %3018 = fadd contract float %3013, %3017
  store float %3018, float addrspace(3)* %42, align 4, !tbaa !5
  %3019 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 448), i32 %224
  %3020 = load float, float addrspace(3)* %3019, align 4, !tbaa !5
  %3021 = load float, float addrspace(3)* %226, align 4, !tbaa !5
  %3022 = fmul contract float %3020, %3021
  %3023 = fadd contract float %3018, %3022
  store float %3023, float addrspace(3)* %42, align 4, !tbaa !5
  %3024 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 448), i32 %227
  %3025 = load float, float addrspace(3)* %3024, align 4, !tbaa !5
  %3026 = load float, float addrspace(3)* %229, align 4, !tbaa !5
  %3027 = fmul contract float %3025, %3026
  %3028 = fadd contract float %3023, %3027
  store float %3028, float addrspace(3)* %42, align 4, !tbaa !5
  %3029 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 448), i32 %230
  %3030 = load float, float addrspace(3)* %3029, align 4, !tbaa !5
  %3031 = load float, float addrspace(3)* %232, align 4, !tbaa !5
  %3032 = fmul contract float %3030, %3031
  %3033 = fadd contract float %3028, %3032
  store float %3033, float addrspace(3)* %42, align 4, !tbaa !5
  %3034 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 448), i32 %233
  %3035 = load float, float addrspace(3)* %3034, align 4, !tbaa !5
  %3036 = load float, float addrspace(3)* %235, align 4, !tbaa !5
  %3037 = fmul contract float %3035, %3036
  %3038 = fadd contract float %3033, %3037
  store float %3038, float addrspace(3)* %42, align 4, !tbaa !5
  %3039 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 448), i32 %236
  %3040 = load float, float addrspace(3)* %3039, align 4, !tbaa !5
  %3041 = load float, float addrspace(3)* %238, align 4, !tbaa !5
  %3042 = fmul contract float %3040, %3041
  %3043 = fadd contract float %3038, %3042
  store float %3043, float addrspace(3)* %42, align 4, !tbaa !5
  %3044 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 448), i32 %239
  %3045 = load float, float addrspace(3)* %3044, align 4, !tbaa !5
  %3046 = load float, float addrspace(3)* %241, align 4, !tbaa !5
  %3047 = fmul contract float %3045, %3046
  %3048 = fadd contract float %3043, %3047
  store float %3048, float addrspace(3)* %42, align 4, !tbaa !5
  %3049 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 448), i32 %242
  %3050 = load float, float addrspace(3)* %3049, align 4, !tbaa !5
  %3051 = load float, float addrspace(3)* %244, align 4, !tbaa !5
  %3052 = fmul contract float %3050, %3051
  %3053 = fadd contract float %3048, %3052
  store float %3053, float addrspace(3)* %42, align 4, !tbaa !5
  %3054 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 448), i32 %245
  %3055 = load float, float addrspace(3)* %3054, align 4, !tbaa !5
  %3056 = load float, float addrspace(3)* %247, align 4, !tbaa !5
  %3057 = fmul contract float %3055, %3056
  %3058 = fadd contract float %3053, %3057
  store float %3058, float addrspace(3)* %42, align 4, !tbaa !5
  %3059 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 448), i32 %248
  %3060 = load float, float addrspace(3)* %3059, align 4, !tbaa !5
  %3061 = load float, float addrspace(3)* %250, align 4, !tbaa !5
  %3062 = fmul contract float %3060, %3061
  %3063 = fadd contract float %3058, %3062
  store float %3063, float addrspace(3)* %42, align 4, !tbaa !5
  %3064 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 448), i32 %251
  %3065 = load float, float addrspace(3)* %3064, align 4, !tbaa !5
  %3066 = load float, float addrspace(3)* %253, align 4, !tbaa !5
  %3067 = fmul contract float %3065, %3066
  %3068 = fadd contract float %3063, %3067
  store float %3068, float addrspace(3)* %42, align 4, !tbaa !5
  %3069 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 448), i32 %254
  %3070 = load float, float addrspace(3)* %3069, align 4, !tbaa !5
  %3071 = load float, float addrspace(3)* %256, align 4, !tbaa !5
  %3072 = fmul contract float %3070, %3071
  %3073 = fadd contract float %3068, %3072
  store float %3073, float addrspace(3)* %42, align 4, !tbaa !5
  %3074 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 448), i32 %257
  %3075 = load float, float addrspace(3)* %3074, align 4, !tbaa !5
  %3076 = load float, float addrspace(3)* %259, align 4, !tbaa !5
  %3077 = fmul contract float %3075, %3076
  %3078 = fadd contract float %3073, %3077
  store float %3078, float addrspace(3)* %42, align 4, !tbaa !5
  %3079 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 448), i32 %260
  %3080 = load float, float addrspace(3)* %3079, align 4, !tbaa !5
  %3081 = load float, float addrspace(3)* %262, align 4, !tbaa !5
  %3082 = fmul contract float %3080, %3081
  %3083 = fadd contract float %3078, %3082
  store float %3083, float addrspace(3)* %42, align 4, !tbaa !5
  %3084 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 448), i32 %263
  %3085 = load float, float addrspace(3)* %3084, align 4, !tbaa !5
  %3086 = load float, float addrspace(3)* %265, align 4, !tbaa !5
  %3087 = fmul contract float %3085, %3086
  %3088 = fadd contract float %3083, %3087
  store float %3088, float addrspace(3)* %42, align 4, !tbaa !5
  %3089 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 448), i32 %266
  %3090 = load float, float addrspace(3)* %3089, align 4, !tbaa !5
  %3091 = load float, float addrspace(3)* %268, align 4, !tbaa !5
  %3092 = fmul contract float %3090, %3091
  %3093 = fadd contract float %3088, %3092
  store float %3093, float addrspace(3)* %42, align 4, !tbaa !5
  %3094 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 448), i32 %269
  %3095 = load float, float addrspace(3)* %3094, align 4, !tbaa !5
  %3096 = load float, float addrspace(3)* %271, align 4, !tbaa !5
  %3097 = fmul contract float %3095, %3096
  %3098 = fadd contract float %3093, %3097
  store float %3098, float addrspace(3)* %42, align 4, !tbaa !5
  %3099 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 448), i32 %272
  %3100 = load float, float addrspace(3)* %3099, align 4, !tbaa !5
  %3101 = load float, float addrspace(3)* %274, align 4, !tbaa !5
  %3102 = fmul contract float %3100, %3101
  %3103 = fadd contract float %3098, %3102
  store float %3103, float addrspace(3)* %42, align 4, !tbaa !5
  %3104 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 448), i32 %275
  %3105 = load float, float addrspace(3)* %3104, align 4, !tbaa !5
  %3106 = load float, float addrspace(3)* %277, align 4, !tbaa !5
  %3107 = fmul contract float %3105, %3106
  %3108 = fadd contract float %3103, %3107
  store float %3108, float addrspace(3)* %42, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %3109 = zext i32 %10 to i64
  %3110 = shl nsw i32 %6, 9
  %3111 = sext i32 %3110 to i64
  %3112 = getelementptr inbounds float, float addrspace(1)* %4, i64 %3111
  %3113 = load float, float addrspace(3)* %41, align 4, !tbaa !5
  %3114 = load float, float addrspace(3)* %42, align 4, !tbaa !5
  %3115 = fmul contract float %3113, %3114
  %3116 = load float, float addrspace(3)* %38, align 4, !tbaa !5
  %3117 = fadd contract float %3115, %3116
  %3118 = fcmp contract ogt float %3117, 0.000000e+00
  %3119 = select contract i1 %3118, float %3117, float 0.000000e+00
  %3120 = getelementptr inbounds float, float addrspace(1)* %3112, i64 %3109
  store float %3119, float addrspace(1)* %3120, align 4, !tbaa !5
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
