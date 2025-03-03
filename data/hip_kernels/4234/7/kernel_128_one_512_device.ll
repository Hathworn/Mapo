; ModuleID = '../data/hip_kernels/4234/7/main.cu'
source_filename = "../data/hip_kernels/4234/7/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@shared_ = external hidden local_unnamed_addr addrspace(3) global [0 x float], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z18kernel_128_one_512PfS_S_S_S_(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture writeonly %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %9 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %10 = shl nuw nsw i32 %9, 7
  %11 = add nuw nsw i32 %10, %8
  %12 = shl nsw i32 %6, 9
  %13 = add nsw i32 %11, %12
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds float, float addrspace(1)* %0, i64 %14
  %16 = load float, float addrspace(1)* %15, align 4, !tbaa !5, !amdgpu.noclobber !9
  %17 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %11
  store float %16, float addrspace(3)* %17, align 4, !tbaa !5
  %18 = shl nsw i32 %7, 7
  %19 = add i32 %18, %8
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds float, float addrspace(1)* %2, i64 %20
  %22 = load float, float addrspace(1)* %21, align 4, !tbaa !5, !amdgpu.noclobber !9
  %23 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 9216), i32 %8
  store float %22, float addrspace(3)* %23, align 4, !tbaa !5
  %24 = getelementptr inbounds float, float addrspace(1)* %3, i64 %20
  %25 = load float, float addrspace(1)* %24, align 4, !tbaa !5, !amdgpu.noclobber !9
  %26 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 9344), i32 %8
  store float %25, float addrspace(3)* %26, align 4, !tbaa !5
  %27 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 8704), i32 %11
  store float 0.000000e+00, float addrspace(3)* %27, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %28 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 512), i32 %11
  %29 = add nuw nsw i32 %11, 512
  %30 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 512), i32 %29
  %31 = add nuw nsw i32 %11, 1024
  %32 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 512), i32 %31
  %33 = add nuw nsw i32 %11, 1536
  %34 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 512), i32 %33
  %35 = add nuw nsw i32 %11, 2048
  %36 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 512), i32 %35
  %37 = add nuw nsw i32 %11, 2560
  %38 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 512), i32 %37
  %39 = add nuw nsw i32 %11, 3072
  %40 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 512), i32 %39
  %41 = add nuw nsw i32 %11, 3584
  %42 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 512), i32 %41
  %43 = add nuw nsw i32 %11, 4096
  %44 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 512), i32 %43
  %45 = add nuw nsw i32 %11, 4608
  %46 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 512), i32 %45
  %47 = add nuw nsw i32 %11, 5120
  %48 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 512), i32 %47
  %49 = add nuw nsw i32 %11, 5632
  %50 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 512), i32 %49
  %51 = add nuw nsw i32 %11, 6144
  %52 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 512), i32 %51
  %53 = add nuw nsw i32 %11, 6656
  %54 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 512), i32 %53
  %55 = add nuw nsw i32 %11, 7168
  %56 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 512), i32 %55
  %57 = add nuw nsw i32 %11, 7680
  %58 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 512), i32 %57
  %59 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 512), i32 %8
  %60 = add nuw nsw i32 %10, 1
  %61 = add nuw nsw i32 %8, 128
  %62 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 512), i32 %61
  %63 = add nuw nsw i32 %10, 2
  %64 = add nuw nsw i32 %8, 256
  %65 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 512), i32 %64
  %66 = add nuw nsw i32 %10, 3
  %67 = add nuw nsw i32 %8, 384
  %68 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 512), i32 %67
  %69 = add nuw nsw i32 %10, 4
  %70 = add nuw nsw i32 %8, 512
  %71 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 512), i32 %70
  %72 = add nuw nsw i32 %10, 5
  %73 = add nuw nsw i32 %8, 640
  %74 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 512), i32 %73
  %75 = add nuw nsw i32 %10, 6
  %76 = add nuw nsw i32 %8, 768
  %77 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 512), i32 %76
  %78 = add nuw nsw i32 %10, 7
  %79 = add nuw nsw i32 %8, 896
  %80 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 512), i32 %79
  %81 = add nuw nsw i32 %10, 8
  %82 = or i32 %8, 1024
  %83 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 512), i32 %82
  %84 = add nuw nsw i32 %10, 9
  %85 = add nuw nsw i32 %8, 1152
  %86 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 512), i32 %85
  %87 = add nuw nsw i32 %10, 10
  %88 = add nuw nsw i32 %8, 1280
  %89 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 512), i32 %88
  %90 = add nuw nsw i32 %10, 11
  %91 = add nuw nsw i32 %8, 1408
  %92 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 512), i32 %91
  %93 = add nuw nsw i32 %10, 12
  %94 = add nuw nsw i32 %8, 1536
  %95 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 512), i32 %94
  %96 = add nuw nsw i32 %10, 13
  %97 = add nuw nsw i32 %8, 1664
  %98 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 512), i32 %97
  %99 = add nuw nsw i32 %10, 14
  %100 = add nuw nsw i32 %8, 1792
  %101 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 512), i32 %100
  %102 = add nuw nsw i32 %10, 15
  %103 = add nuw nsw i32 %8, 1920
  %104 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 512), i32 %103
  %105 = add nuw nsw i32 %10, 16
  %106 = or i32 %8, 2048
  %107 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 512), i32 %106
  %108 = add nuw nsw i32 %10, 17
  %109 = add nuw nsw i32 %8, 2176
  %110 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 512), i32 %109
  %111 = add nuw nsw i32 %10, 18
  %112 = add nuw nsw i32 %8, 2304
  %113 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 512), i32 %112
  %114 = add nuw nsw i32 %10, 19
  %115 = add nuw nsw i32 %8, 2432
  %116 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 512), i32 %115
  %117 = add nuw nsw i32 %10, 20
  %118 = add nuw nsw i32 %8, 2560
  %119 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 512), i32 %118
  %120 = add nuw nsw i32 %10, 21
  %121 = add nuw nsw i32 %8, 2688
  %122 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 512), i32 %121
  %123 = add nuw nsw i32 %10, 22
  %124 = add nuw nsw i32 %8, 2816
  %125 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 512), i32 %124
  %126 = add nuw nsw i32 %10, 23
  %127 = add nuw nsw i32 %8, 2944
  %128 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 512), i32 %127
  %129 = add nuw nsw i32 %10, 24
  %130 = or i32 %8, 3072
  %131 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 512), i32 %130
  %132 = add nuw nsw i32 %10, 25
  %133 = add nuw nsw i32 %8, 3200
  %134 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 512), i32 %133
  %135 = add nuw nsw i32 %10, 26
  %136 = add nuw nsw i32 %8, 3328
  %137 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 512), i32 %136
  %138 = add nuw nsw i32 %10, 27
  %139 = add nuw nsw i32 %8, 3456
  %140 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 512), i32 %139
  %141 = add nuw nsw i32 %10, 28
  %142 = add nuw nsw i32 %8, 3584
  %143 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 512), i32 %142
  %144 = add nuw nsw i32 %10, 29
  %145 = add nuw nsw i32 %8, 3712
  %146 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 512), i32 %145
  %147 = add nuw nsw i32 %10, 30
  %148 = add nuw nsw i32 %8, 3840
  %149 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 512), i32 %148
  %150 = add nuw nsw i32 %10, 31
  %151 = add nuw nsw i32 %8, 3968
  %152 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 512), i32 %151
  %153 = add nuw nsw i32 %10, 32
  %154 = or i32 %8, 4096
  %155 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 512), i32 %154
  %156 = add nuw nsw i32 %10, 33
  %157 = add nuw nsw i32 %8, 4224
  %158 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 512), i32 %157
  %159 = add nuw nsw i32 %10, 34
  %160 = add nuw nsw i32 %8, 4352
  %161 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 512), i32 %160
  %162 = add nuw nsw i32 %10, 35
  %163 = add nuw nsw i32 %8, 4480
  %164 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 512), i32 %163
  %165 = add nuw nsw i32 %10, 36
  %166 = add nuw nsw i32 %8, 4608
  %167 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 512), i32 %166
  %168 = add nuw nsw i32 %10, 37
  %169 = add nuw nsw i32 %8, 4736
  %170 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 512), i32 %169
  %171 = add nuw nsw i32 %10, 38
  %172 = add nuw nsw i32 %8, 4864
  %173 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 512), i32 %172
  %174 = add nuw nsw i32 %10, 39
  %175 = add nuw nsw i32 %8, 4992
  %176 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 512), i32 %175
  %177 = add nuw nsw i32 %10, 40
  %178 = or i32 %8, 5120
  %179 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 512), i32 %178
  %180 = add nuw nsw i32 %10, 41
  %181 = add nuw nsw i32 %8, 5248
  %182 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 512), i32 %181
  %183 = add nuw nsw i32 %10, 42
  %184 = add nuw nsw i32 %8, 5376
  %185 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 512), i32 %184
  %186 = add nuw nsw i32 %10, 43
  %187 = add nuw nsw i32 %8, 5504
  %188 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 512), i32 %187
  %189 = add nuw nsw i32 %10, 44
  %190 = add nuw nsw i32 %8, 5632
  %191 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 512), i32 %190
  %192 = add nuw nsw i32 %10, 45
  %193 = add nuw nsw i32 %8, 5760
  %194 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 512), i32 %193
  %195 = add nuw nsw i32 %10, 46
  %196 = add nuw nsw i32 %8, 5888
  %197 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 512), i32 %196
  %198 = add nuw nsw i32 %10, 47
  %199 = add nuw nsw i32 %8, 6016
  %200 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 512), i32 %199
  %201 = add nuw nsw i32 %10, 48
  %202 = or i32 %8, 6144
  %203 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 512), i32 %202
  %204 = add nuw nsw i32 %10, 49
  %205 = add nuw nsw i32 %8, 6272
  %206 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 512), i32 %205
  %207 = add nuw nsw i32 %10, 50
  %208 = add nuw nsw i32 %8, 6400
  %209 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 512), i32 %208
  %210 = add nuw nsw i32 %10, 51
  %211 = add nuw nsw i32 %8, 6528
  %212 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 512), i32 %211
  %213 = add nuw nsw i32 %10, 52
  %214 = add nuw nsw i32 %8, 6656
  %215 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 512), i32 %214
  %216 = add nuw nsw i32 %10, 53
  %217 = add nuw nsw i32 %8, 6784
  %218 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 512), i32 %217
  %219 = add nuw nsw i32 %10, 54
  %220 = add nuw nsw i32 %8, 6912
  %221 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 512), i32 %220
  %222 = add nuw nsw i32 %10, 55
  %223 = add nuw nsw i32 %8, 7040
  %224 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 512), i32 %223
  %225 = add nuw nsw i32 %10, 56
  %226 = or i32 %8, 7168
  %227 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 512), i32 %226
  %228 = add nuw nsw i32 %10, 57
  %229 = add nuw nsw i32 %8, 7296
  %230 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 512), i32 %229
  %231 = add nuw nsw i32 %10, 58
  %232 = add nuw nsw i32 %8, 7424
  %233 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 512), i32 %232
  %234 = add nuw nsw i32 %10, 59
  %235 = add nuw nsw i32 %8, 7552
  %236 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 512), i32 %235
  %237 = add nuw nsw i32 %10, 60
  %238 = add nuw nsw i32 %8, 7680
  %239 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 512), i32 %238
  %240 = add nuw nsw i32 %10, 61
  %241 = add nuw nsw i32 %8, 7808
  %242 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 512), i32 %241
  %243 = add nuw nsw i32 %10, 62
  %244 = add nuw nsw i32 %8, 7936
  %245 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 512), i32 %244
  %246 = add nuw nsw i32 %10, 63
  %247 = add nuw nsw i32 %8, 8064
  %248 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 512), i32 %247
  %249 = shl nuw nsw i32 %9, 9
  %250 = add i32 %19, %249
  %251 = sext i32 %250 to i64
  %252 = getelementptr inbounds float, float addrspace(1)* %1, i64 %251
  %253 = load float, float addrspace(1)* %252, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %253, float addrspace(3)* %28, align 4, !tbaa !5
  %254 = add nuw nsw i32 %249, 2048
  %255 = add i32 %19, %254
  %256 = sext i32 %255 to i64
  %257 = getelementptr inbounds float, float addrspace(1)* %1, i64 %256
  %258 = load float, float addrspace(1)* %257, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %258, float addrspace(3)* %30, align 4, !tbaa !5
  %259 = add nuw nsw i32 %249, 4096
  %260 = add i32 %19, %259
  %261 = sext i32 %260 to i64
  %262 = getelementptr inbounds float, float addrspace(1)* %1, i64 %261
  %263 = load float, float addrspace(1)* %262, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %263, float addrspace(3)* %32, align 4, !tbaa !5
  %264 = add nuw nsw i32 %249, 6144
  %265 = add i32 %19, %264
  %266 = sext i32 %265 to i64
  %267 = getelementptr inbounds float, float addrspace(1)* %1, i64 %266
  %268 = load float, float addrspace(1)* %267, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %268, float addrspace(3)* %34, align 4, !tbaa !5
  %269 = add nuw nsw i32 %249, 8192
  %270 = add i32 %19, %269
  %271 = sext i32 %270 to i64
  %272 = getelementptr inbounds float, float addrspace(1)* %1, i64 %271
  %273 = load float, float addrspace(1)* %272, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %273, float addrspace(3)* %36, align 4, !tbaa !5
  %274 = add nuw nsw i32 %249, 10240
  %275 = add i32 %19, %274
  %276 = sext i32 %275 to i64
  %277 = getelementptr inbounds float, float addrspace(1)* %1, i64 %276
  %278 = load float, float addrspace(1)* %277, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %278, float addrspace(3)* %38, align 4, !tbaa !5
  %279 = add nuw nsw i32 %249, 12288
  %280 = add i32 %19, %279
  %281 = sext i32 %280 to i64
  %282 = getelementptr inbounds float, float addrspace(1)* %1, i64 %281
  %283 = load float, float addrspace(1)* %282, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %283, float addrspace(3)* %40, align 4, !tbaa !5
  %284 = add nuw nsw i32 %249, 14336
  %285 = add i32 %19, %284
  %286 = sext i32 %285 to i64
  %287 = getelementptr inbounds float, float addrspace(1)* %1, i64 %286
  %288 = load float, float addrspace(1)* %287, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %288, float addrspace(3)* %42, align 4, !tbaa !5
  %289 = add nuw nsw i32 %249, 16384
  %290 = add i32 %19, %289
  %291 = sext i32 %290 to i64
  %292 = getelementptr inbounds float, float addrspace(1)* %1, i64 %291
  %293 = load float, float addrspace(1)* %292, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %293, float addrspace(3)* %44, align 4, !tbaa !5
  %294 = add nuw nsw i32 %249, 18432
  %295 = add i32 %19, %294
  %296 = sext i32 %295 to i64
  %297 = getelementptr inbounds float, float addrspace(1)* %1, i64 %296
  %298 = load float, float addrspace(1)* %297, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %298, float addrspace(3)* %46, align 4, !tbaa !5
  %299 = add nuw nsw i32 %249, 20480
  %300 = add i32 %19, %299
  %301 = sext i32 %300 to i64
  %302 = getelementptr inbounds float, float addrspace(1)* %1, i64 %301
  %303 = load float, float addrspace(1)* %302, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %303, float addrspace(3)* %48, align 4, !tbaa !5
  %304 = add nuw nsw i32 %249, 22528
  %305 = add i32 %19, %304
  %306 = sext i32 %305 to i64
  %307 = getelementptr inbounds float, float addrspace(1)* %1, i64 %306
  %308 = load float, float addrspace(1)* %307, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %308, float addrspace(3)* %50, align 4, !tbaa !5
  %309 = add nuw nsw i32 %249, 24576
  %310 = add i32 %19, %309
  %311 = sext i32 %310 to i64
  %312 = getelementptr inbounds float, float addrspace(1)* %1, i64 %311
  %313 = load float, float addrspace(1)* %312, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %313, float addrspace(3)* %52, align 4, !tbaa !5
  %314 = add nuw nsw i32 %249, 26624
  %315 = add i32 %19, %314
  %316 = sext i32 %315 to i64
  %317 = getelementptr inbounds float, float addrspace(1)* %1, i64 %316
  %318 = load float, float addrspace(1)* %317, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %318, float addrspace(3)* %54, align 4, !tbaa !5
  %319 = add nuw nsw i32 %249, 28672
  %320 = add i32 %19, %319
  %321 = sext i32 %320 to i64
  %322 = getelementptr inbounds float, float addrspace(1)* %1, i64 %321
  %323 = load float, float addrspace(1)* %322, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %323, float addrspace(3)* %56, align 4, !tbaa !5
  %324 = add nuw nsw i32 %249, 30720
  %325 = add i32 %19, %324
  %326 = sext i32 %325 to i64
  %327 = getelementptr inbounds float, float addrspace(1)* %1, i64 %326
  %328 = load float, float addrspace(1)* %327, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %328, float addrspace(3)* %58, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %329 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %10
  %330 = load float, float addrspace(3)* %329, align 4, !tbaa !5
  %331 = load float, float addrspace(3)* %59, align 4, !tbaa !5
  %332 = fmul contract float %330, %331
  %333 = load float, float addrspace(3)* %27, align 4, !tbaa !5
  %334 = fadd contract float %333, %332
  store float %334, float addrspace(3)* %27, align 4, !tbaa !5
  %335 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %60
  %336 = load float, float addrspace(3)* %335, align 4, !tbaa !5
  %337 = load float, float addrspace(3)* %62, align 4, !tbaa !5
  %338 = fmul contract float %336, %337
  %339 = fadd contract float %334, %338
  store float %339, float addrspace(3)* %27, align 4, !tbaa !5
  %340 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %63
  %341 = load float, float addrspace(3)* %340, align 4, !tbaa !5
  %342 = load float, float addrspace(3)* %65, align 4, !tbaa !5
  %343 = fmul contract float %341, %342
  %344 = fadd contract float %339, %343
  store float %344, float addrspace(3)* %27, align 4, !tbaa !5
  %345 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %66
  %346 = load float, float addrspace(3)* %345, align 4, !tbaa !5
  %347 = load float, float addrspace(3)* %68, align 4, !tbaa !5
  %348 = fmul contract float %346, %347
  %349 = fadd contract float %344, %348
  store float %349, float addrspace(3)* %27, align 4, !tbaa !5
  %350 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %69
  %351 = load float, float addrspace(3)* %350, align 4, !tbaa !5
  %352 = load float, float addrspace(3)* %71, align 4, !tbaa !5
  %353 = fmul contract float %351, %352
  %354 = fadd contract float %349, %353
  store float %354, float addrspace(3)* %27, align 4, !tbaa !5
  %355 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %72
  %356 = load float, float addrspace(3)* %355, align 4, !tbaa !5
  %357 = load float, float addrspace(3)* %74, align 4, !tbaa !5
  %358 = fmul contract float %356, %357
  %359 = fadd contract float %354, %358
  store float %359, float addrspace(3)* %27, align 4, !tbaa !5
  %360 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %75
  %361 = load float, float addrspace(3)* %360, align 4, !tbaa !5
  %362 = load float, float addrspace(3)* %77, align 4, !tbaa !5
  %363 = fmul contract float %361, %362
  %364 = fadd contract float %359, %363
  store float %364, float addrspace(3)* %27, align 4, !tbaa !5
  %365 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %78
  %366 = load float, float addrspace(3)* %365, align 4, !tbaa !5
  %367 = load float, float addrspace(3)* %80, align 4, !tbaa !5
  %368 = fmul contract float %366, %367
  %369 = fadd contract float %364, %368
  store float %369, float addrspace(3)* %27, align 4, !tbaa !5
  %370 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %81
  %371 = load float, float addrspace(3)* %370, align 4, !tbaa !5
  %372 = load float, float addrspace(3)* %83, align 4, !tbaa !5
  %373 = fmul contract float %371, %372
  %374 = fadd contract float %369, %373
  store float %374, float addrspace(3)* %27, align 4, !tbaa !5
  %375 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %84
  %376 = load float, float addrspace(3)* %375, align 4, !tbaa !5
  %377 = load float, float addrspace(3)* %86, align 4, !tbaa !5
  %378 = fmul contract float %376, %377
  %379 = fadd contract float %374, %378
  store float %379, float addrspace(3)* %27, align 4, !tbaa !5
  %380 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %87
  %381 = load float, float addrspace(3)* %380, align 4, !tbaa !5
  %382 = load float, float addrspace(3)* %89, align 4, !tbaa !5
  %383 = fmul contract float %381, %382
  %384 = fadd contract float %379, %383
  store float %384, float addrspace(3)* %27, align 4, !tbaa !5
  %385 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %90
  %386 = load float, float addrspace(3)* %385, align 4, !tbaa !5
  %387 = load float, float addrspace(3)* %92, align 4, !tbaa !5
  %388 = fmul contract float %386, %387
  %389 = fadd contract float %384, %388
  store float %389, float addrspace(3)* %27, align 4, !tbaa !5
  %390 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %93
  %391 = load float, float addrspace(3)* %390, align 4, !tbaa !5
  %392 = load float, float addrspace(3)* %95, align 4, !tbaa !5
  %393 = fmul contract float %391, %392
  %394 = fadd contract float %389, %393
  store float %394, float addrspace(3)* %27, align 4, !tbaa !5
  %395 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %96
  %396 = load float, float addrspace(3)* %395, align 4, !tbaa !5
  %397 = load float, float addrspace(3)* %98, align 4, !tbaa !5
  %398 = fmul contract float %396, %397
  %399 = fadd contract float %394, %398
  store float %399, float addrspace(3)* %27, align 4, !tbaa !5
  %400 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %99
  %401 = load float, float addrspace(3)* %400, align 4, !tbaa !5
  %402 = load float, float addrspace(3)* %101, align 4, !tbaa !5
  %403 = fmul contract float %401, %402
  %404 = fadd contract float %399, %403
  store float %404, float addrspace(3)* %27, align 4, !tbaa !5
  %405 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %102
  %406 = load float, float addrspace(3)* %405, align 4, !tbaa !5
  %407 = load float, float addrspace(3)* %104, align 4, !tbaa !5
  %408 = fmul contract float %406, %407
  %409 = fadd contract float %404, %408
  store float %409, float addrspace(3)* %27, align 4, !tbaa !5
  %410 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %105
  %411 = load float, float addrspace(3)* %410, align 4, !tbaa !5
  %412 = load float, float addrspace(3)* %107, align 4, !tbaa !5
  %413 = fmul contract float %411, %412
  %414 = fadd contract float %409, %413
  store float %414, float addrspace(3)* %27, align 4, !tbaa !5
  %415 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %108
  %416 = load float, float addrspace(3)* %415, align 4, !tbaa !5
  %417 = load float, float addrspace(3)* %110, align 4, !tbaa !5
  %418 = fmul contract float %416, %417
  %419 = fadd contract float %414, %418
  store float %419, float addrspace(3)* %27, align 4, !tbaa !5
  %420 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %111
  %421 = load float, float addrspace(3)* %420, align 4, !tbaa !5
  %422 = load float, float addrspace(3)* %113, align 4, !tbaa !5
  %423 = fmul contract float %421, %422
  %424 = fadd contract float %419, %423
  store float %424, float addrspace(3)* %27, align 4, !tbaa !5
  %425 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %114
  %426 = load float, float addrspace(3)* %425, align 4, !tbaa !5
  %427 = load float, float addrspace(3)* %116, align 4, !tbaa !5
  %428 = fmul contract float %426, %427
  %429 = fadd contract float %424, %428
  store float %429, float addrspace(3)* %27, align 4, !tbaa !5
  %430 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %117
  %431 = load float, float addrspace(3)* %430, align 4, !tbaa !5
  %432 = load float, float addrspace(3)* %119, align 4, !tbaa !5
  %433 = fmul contract float %431, %432
  %434 = fadd contract float %429, %433
  store float %434, float addrspace(3)* %27, align 4, !tbaa !5
  %435 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %120
  %436 = load float, float addrspace(3)* %435, align 4, !tbaa !5
  %437 = load float, float addrspace(3)* %122, align 4, !tbaa !5
  %438 = fmul contract float %436, %437
  %439 = fadd contract float %434, %438
  store float %439, float addrspace(3)* %27, align 4, !tbaa !5
  %440 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %123
  %441 = load float, float addrspace(3)* %440, align 4, !tbaa !5
  %442 = load float, float addrspace(3)* %125, align 4, !tbaa !5
  %443 = fmul contract float %441, %442
  %444 = fadd contract float %439, %443
  store float %444, float addrspace(3)* %27, align 4, !tbaa !5
  %445 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %126
  %446 = load float, float addrspace(3)* %445, align 4, !tbaa !5
  %447 = load float, float addrspace(3)* %128, align 4, !tbaa !5
  %448 = fmul contract float %446, %447
  %449 = fadd contract float %444, %448
  store float %449, float addrspace(3)* %27, align 4, !tbaa !5
  %450 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %129
  %451 = load float, float addrspace(3)* %450, align 4, !tbaa !5
  %452 = load float, float addrspace(3)* %131, align 4, !tbaa !5
  %453 = fmul contract float %451, %452
  %454 = fadd contract float %449, %453
  store float %454, float addrspace(3)* %27, align 4, !tbaa !5
  %455 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %132
  %456 = load float, float addrspace(3)* %455, align 4, !tbaa !5
  %457 = load float, float addrspace(3)* %134, align 4, !tbaa !5
  %458 = fmul contract float %456, %457
  %459 = fadd contract float %454, %458
  store float %459, float addrspace(3)* %27, align 4, !tbaa !5
  %460 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %135
  %461 = load float, float addrspace(3)* %460, align 4, !tbaa !5
  %462 = load float, float addrspace(3)* %137, align 4, !tbaa !5
  %463 = fmul contract float %461, %462
  %464 = fadd contract float %459, %463
  store float %464, float addrspace(3)* %27, align 4, !tbaa !5
  %465 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %138
  %466 = load float, float addrspace(3)* %465, align 4, !tbaa !5
  %467 = load float, float addrspace(3)* %140, align 4, !tbaa !5
  %468 = fmul contract float %466, %467
  %469 = fadd contract float %464, %468
  store float %469, float addrspace(3)* %27, align 4, !tbaa !5
  %470 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %141
  %471 = load float, float addrspace(3)* %470, align 4, !tbaa !5
  %472 = load float, float addrspace(3)* %143, align 4, !tbaa !5
  %473 = fmul contract float %471, %472
  %474 = fadd contract float %469, %473
  store float %474, float addrspace(3)* %27, align 4, !tbaa !5
  %475 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %144
  %476 = load float, float addrspace(3)* %475, align 4, !tbaa !5
  %477 = load float, float addrspace(3)* %146, align 4, !tbaa !5
  %478 = fmul contract float %476, %477
  %479 = fadd contract float %474, %478
  store float %479, float addrspace(3)* %27, align 4, !tbaa !5
  %480 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %147
  %481 = load float, float addrspace(3)* %480, align 4, !tbaa !5
  %482 = load float, float addrspace(3)* %149, align 4, !tbaa !5
  %483 = fmul contract float %481, %482
  %484 = fadd contract float %479, %483
  store float %484, float addrspace(3)* %27, align 4, !tbaa !5
  %485 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %150
  %486 = load float, float addrspace(3)* %485, align 4, !tbaa !5
  %487 = load float, float addrspace(3)* %152, align 4, !tbaa !5
  %488 = fmul contract float %486, %487
  %489 = fadd contract float %484, %488
  store float %489, float addrspace(3)* %27, align 4, !tbaa !5
  %490 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %153
  %491 = load float, float addrspace(3)* %490, align 4, !tbaa !5
  %492 = load float, float addrspace(3)* %155, align 4, !tbaa !5
  %493 = fmul contract float %491, %492
  %494 = fadd contract float %489, %493
  store float %494, float addrspace(3)* %27, align 4, !tbaa !5
  %495 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %156
  %496 = load float, float addrspace(3)* %495, align 4, !tbaa !5
  %497 = load float, float addrspace(3)* %158, align 4, !tbaa !5
  %498 = fmul contract float %496, %497
  %499 = fadd contract float %494, %498
  store float %499, float addrspace(3)* %27, align 4, !tbaa !5
  %500 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %159
  %501 = load float, float addrspace(3)* %500, align 4, !tbaa !5
  %502 = load float, float addrspace(3)* %161, align 4, !tbaa !5
  %503 = fmul contract float %501, %502
  %504 = fadd contract float %499, %503
  store float %504, float addrspace(3)* %27, align 4, !tbaa !5
  %505 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %162
  %506 = load float, float addrspace(3)* %505, align 4, !tbaa !5
  %507 = load float, float addrspace(3)* %164, align 4, !tbaa !5
  %508 = fmul contract float %506, %507
  %509 = fadd contract float %504, %508
  store float %509, float addrspace(3)* %27, align 4, !tbaa !5
  %510 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %165
  %511 = load float, float addrspace(3)* %510, align 4, !tbaa !5
  %512 = load float, float addrspace(3)* %167, align 4, !tbaa !5
  %513 = fmul contract float %511, %512
  %514 = fadd contract float %509, %513
  store float %514, float addrspace(3)* %27, align 4, !tbaa !5
  %515 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %168
  %516 = load float, float addrspace(3)* %515, align 4, !tbaa !5
  %517 = load float, float addrspace(3)* %170, align 4, !tbaa !5
  %518 = fmul contract float %516, %517
  %519 = fadd contract float %514, %518
  store float %519, float addrspace(3)* %27, align 4, !tbaa !5
  %520 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %171
  %521 = load float, float addrspace(3)* %520, align 4, !tbaa !5
  %522 = load float, float addrspace(3)* %173, align 4, !tbaa !5
  %523 = fmul contract float %521, %522
  %524 = fadd contract float %519, %523
  store float %524, float addrspace(3)* %27, align 4, !tbaa !5
  %525 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %174
  %526 = load float, float addrspace(3)* %525, align 4, !tbaa !5
  %527 = load float, float addrspace(3)* %176, align 4, !tbaa !5
  %528 = fmul contract float %526, %527
  %529 = fadd contract float %524, %528
  store float %529, float addrspace(3)* %27, align 4, !tbaa !5
  %530 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %177
  %531 = load float, float addrspace(3)* %530, align 4, !tbaa !5
  %532 = load float, float addrspace(3)* %179, align 4, !tbaa !5
  %533 = fmul contract float %531, %532
  %534 = fadd contract float %529, %533
  store float %534, float addrspace(3)* %27, align 4, !tbaa !5
  %535 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %180
  %536 = load float, float addrspace(3)* %535, align 4, !tbaa !5
  %537 = load float, float addrspace(3)* %182, align 4, !tbaa !5
  %538 = fmul contract float %536, %537
  %539 = fadd contract float %534, %538
  store float %539, float addrspace(3)* %27, align 4, !tbaa !5
  %540 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %183
  %541 = load float, float addrspace(3)* %540, align 4, !tbaa !5
  %542 = load float, float addrspace(3)* %185, align 4, !tbaa !5
  %543 = fmul contract float %541, %542
  %544 = fadd contract float %539, %543
  store float %544, float addrspace(3)* %27, align 4, !tbaa !5
  %545 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %186
  %546 = load float, float addrspace(3)* %545, align 4, !tbaa !5
  %547 = load float, float addrspace(3)* %188, align 4, !tbaa !5
  %548 = fmul contract float %546, %547
  %549 = fadd contract float %544, %548
  store float %549, float addrspace(3)* %27, align 4, !tbaa !5
  %550 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %189
  %551 = load float, float addrspace(3)* %550, align 4, !tbaa !5
  %552 = load float, float addrspace(3)* %191, align 4, !tbaa !5
  %553 = fmul contract float %551, %552
  %554 = fadd contract float %549, %553
  store float %554, float addrspace(3)* %27, align 4, !tbaa !5
  %555 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %192
  %556 = load float, float addrspace(3)* %555, align 4, !tbaa !5
  %557 = load float, float addrspace(3)* %194, align 4, !tbaa !5
  %558 = fmul contract float %556, %557
  %559 = fadd contract float %554, %558
  store float %559, float addrspace(3)* %27, align 4, !tbaa !5
  %560 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %195
  %561 = load float, float addrspace(3)* %560, align 4, !tbaa !5
  %562 = load float, float addrspace(3)* %197, align 4, !tbaa !5
  %563 = fmul contract float %561, %562
  %564 = fadd contract float %559, %563
  store float %564, float addrspace(3)* %27, align 4, !tbaa !5
  %565 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %198
  %566 = load float, float addrspace(3)* %565, align 4, !tbaa !5
  %567 = load float, float addrspace(3)* %200, align 4, !tbaa !5
  %568 = fmul contract float %566, %567
  %569 = fadd contract float %564, %568
  store float %569, float addrspace(3)* %27, align 4, !tbaa !5
  %570 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %201
  %571 = load float, float addrspace(3)* %570, align 4, !tbaa !5
  %572 = load float, float addrspace(3)* %203, align 4, !tbaa !5
  %573 = fmul contract float %571, %572
  %574 = fadd contract float %569, %573
  store float %574, float addrspace(3)* %27, align 4, !tbaa !5
  %575 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %204
  %576 = load float, float addrspace(3)* %575, align 4, !tbaa !5
  %577 = load float, float addrspace(3)* %206, align 4, !tbaa !5
  %578 = fmul contract float %576, %577
  %579 = fadd contract float %574, %578
  store float %579, float addrspace(3)* %27, align 4, !tbaa !5
  %580 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %207
  %581 = load float, float addrspace(3)* %580, align 4, !tbaa !5
  %582 = load float, float addrspace(3)* %209, align 4, !tbaa !5
  %583 = fmul contract float %581, %582
  %584 = fadd contract float %579, %583
  store float %584, float addrspace(3)* %27, align 4, !tbaa !5
  %585 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %210
  %586 = load float, float addrspace(3)* %585, align 4, !tbaa !5
  %587 = load float, float addrspace(3)* %212, align 4, !tbaa !5
  %588 = fmul contract float %586, %587
  %589 = fadd contract float %584, %588
  store float %589, float addrspace(3)* %27, align 4, !tbaa !5
  %590 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %213
  %591 = load float, float addrspace(3)* %590, align 4, !tbaa !5
  %592 = load float, float addrspace(3)* %215, align 4, !tbaa !5
  %593 = fmul contract float %591, %592
  %594 = fadd contract float %589, %593
  store float %594, float addrspace(3)* %27, align 4, !tbaa !5
  %595 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %216
  %596 = load float, float addrspace(3)* %595, align 4, !tbaa !5
  %597 = load float, float addrspace(3)* %218, align 4, !tbaa !5
  %598 = fmul contract float %596, %597
  %599 = fadd contract float %594, %598
  store float %599, float addrspace(3)* %27, align 4, !tbaa !5
  %600 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %219
  %601 = load float, float addrspace(3)* %600, align 4, !tbaa !5
  %602 = load float, float addrspace(3)* %221, align 4, !tbaa !5
  %603 = fmul contract float %601, %602
  %604 = fadd contract float %599, %603
  store float %604, float addrspace(3)* %27, align 4, !tbaa !5
  %605 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %222
  %606 = load float, float addrspace(3)* %605, align 4, !tbaa !5
  %607 = load float, float addrspace(3)* %224, align 4, !tbaa !5
  %608 = fmul contract float %606, %607
  %609 = fadd contract float %604, %608
  store float %609, float addrspace(3)* %27, align 4, !tbaa !5
  %610 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %225
  %611 = load float, float addrspace(3)* %610, align 4, !tbaa !5
  %612 = load float, float addrspace(3)* %227, align 4, !tbaa !5
  %613 = fmul contract float %611, %612
  %614 = fadd contract float %609, %613
  store float %614, float addrspace(3)* %27, align 4, !tbaa !5
  %615 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %228
  %616 = load float, float addrspace(3)* %615, align 4, !tbaa !5
  %617 = load float, float addrspace(3)* %230, align 4, !tbaa !5
  %618 = fmul contract float %616, %617
  %619 = fadd contract float %614, %618
  store float %619, float addrspace(3)* %27, align 4, !tbaa !5
  %620 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %231
  %621 = load float, float addrspace(3)* %620, align 4, !tbaa !5
  %622 = load float, float addrspace(3)* %233, align 4, !tbaa !5
  %623 = fmul contract float %621, %622
  %624 = fadd contract float %619, %623
  store float %624, float addrspace(3)* %27, align 4, !tbaa !5
  %625 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %234
  %626 = load float, float addrspace(3)* %625, align 4, !tbaa !5
  %627 = load float, float addrspace(3)* %236, align 4, !tbaa !5
  %628 = fmul contract float %626, %627
  %629 = fadd contract float %624, %628
  store float %629, float addrspace(3)* %27, align 4, !tbaa !5
  %630 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %237
  %631 = load float, float addrspace(3)* %630, align 4, !tbaa !5
  %632 = load float, float addrspace(3)* %239, align 4, !tbaa !5
  %633 = fmul contract float %631, %632
  %634 = fadd contract float %629, %633
  store float %634, float addrspace(3)* %27, align 4, !tbaa !5
  %635 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %240
  %636 = load float, float addrspace(3)* %635, align 4, !tbaa !5
  %637 = load float, float addrspace(3)* %242, align 4, !tbaa !5
  %638 = fmul contract float %636, %637
  %639 = fadd contract float %634, %638
  store float %639, float addrspace(3)* %27, align 4, !tbaa !5
  %640 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %243
  %641 = load float, float addrspace(3)* %640, align 4, !tbaa !5
  %642 = load float, float addrspace(3)* %245, align 4, !tbaa !5
  %643 = fmul contract float %641, %642
  %644 = fadd contract float %639, %643
  store float %644, float addrspace(3)* %27, align 4, !tbaa !5
  %645 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %246
  %646 = load float, float addrspace(3)* %645, align 4, !tbaa !5
  %647 = load float, float addrspace(3)* %248, align 4, !tbaa !5
  %648 = fmul contract float %646, %647
  %649 = fadd contract float %644, %648
  store float %649, float addrspace(3)* %27, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %650 = shl nuw nsw i32 %9, 9
  %651 = add nuw nsw i32 %650, 32768
  %652 = add i32 %19, %651
  %653 = sext i32 %652 to i64
  %654 = getelementptr inbounds float, float addrspace(1)* %1, i64 %653
  %655 = load float, float addrspace(1)* %654, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %655, float addrspace(3)* %28, align 4, !tbaa !5
  %656 = add nuw nsw i32 %650, 34816
  %657 = add i32 %19, %656
  %658 = sext i32 %657 to i64
  %659 = getelementptr inbounds float, float addrspace(1)* %1, i64 %658
  %660 = load float, float addrspace(1)* %659, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %660, float addrspace(3)* %30, align 4, !tbaa !5
  %661 = add nuw nsw i32 %650, 36864
  %662 = add i32 %19, %661
  %663 = sext i32 %662 to i64
  %664 = getelementptr inbounds float, float addrspace(1)* %1, i64 %663
  %665 = load float, float addrspace(1)* %664, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %665, float addrspace(3)* %32, align 4, !tbaa !5
  %666 = add nuw nsw i32 %650, 38912
  %667 = add i32 %19, %666
  %668 = sext i32 %667 to i64
  %669 = getelementptr inbounds float, float addrspace(1)* %1, i64 %668
  %670 = load float, float addrspace(1)* %669, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %670, float addrspace(3)* %34, align 4, !tbaa !5
  %671 = add nuw nsw i32 %650, 40960
  %672 = add i32 %19, %671
  %673 = sext i32 %672 to i64
  %674 = getelementptr inbounds float, float addrspace(1)* %1, i64 %673
  %675 = load float, float addrspace(1)* %674, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %675, float addrspace(3)* %36, align 4, !tbaa !5
  %676 = add nuw nsw i32 %650, 43008
  %677 = add i32 %19, %676
  %678 = sext i32 %677 to i64
  %679 = getelementptr inbounds float, float addrspace(1)* %1, i64 %678
  %680 = load float, float addrspace(1)* %679, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %680, float addrspace(3)* %38, align 4, !tbaa !5
  %681 = add nuw nsw i32 %650, 45056
  %682 = add i32 %19, %681
  %683 = sext i32 %682 to i64
  %684 = getelementptr inbounds float, float addrspace(1)* %1, i64 %683
  %685 = load float, float addrspace(1)* %684, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %685, float addrspace(3)* %40, align 4, !tbaa !5
  %686 = add nuw nsw i32 %650, 47104
  %687 = add i32 %19, %686
  %688 = sext i32 %687 to i64
  %689 = getelementptr inbounds float, float addrspace(1)* %1, i64 %688
  %690 = load float, float addrspace(1)* %689, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %690, float addrspace(3)* %42, align 4, !tbaa !5
  %691 = add nuw nsw i32 %650, 49152
  %692 = add i32 %19, %691
  %693 = sext i32 %692 to i64
  %694 = getelementptr inbounds float, float addrspace(1)* %1, i64 %693
  %695 = load float, float addrspace(1)* %694, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %695, float addrspace(3)* %44, align 4, !tbaa !5
  %696 = add nuw nsw i32 %650, 51200
  %697 = add i32 %19, %696
  %698 = sext i32 %697 to i64
  %699 = getelementptr inbounds float, float addrspace(1)* %1, i64 %698
  %700 = load float, float addrspace(1)* %699, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %700, float addrspace(3)* %46, align 4, !tbaa !5
  %701 = add nuw nsw i32 %650, 53248
  %702 = add i32 %19, %701
  %703 = sext i32 %702 to i64
  %704 = getelementptr inbounds float, float addrspace(1)* %1, i64 %703
  %705 = load float, float addrspace(1)* %704, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %705, float addrspace(3)* %48, align 4, !tbaa !5
  %706 = add nuw nsw i32 %650, 55296
  %707 = add i32 %19, %706
  %708 = sext i32 %707 to i64
  %709 = getelementptr inbounds float, float addrspace(1)* %1, i64 %708
  %710 = load float, float addrspace(1)* %709, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %710, float addrspace(3)* %50, align 4, !tbaa !5
  %711 = add nuw nsw i32 %650, 57344
  %712 = add i32 %19, %711
  %713 = sext i32 %712 to i64
  %714 = getelementptr inbounds float, float addrspace(1)* %1, i64 %713
  %715 = load float, float addrspace(1)* %714, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %715, float addrspace(3)* %52, align 4, !tbaa !5
  %716 = add nuw nsw i32 %650, 59392
  %717 = add i32 %19, %716
  %718 = sext i32 %717 to i64
  %719 = getelementptr inbounds float, float addrspace(1)* %1, i64 %718
  %720 = load float, float addrspace(1)* %719, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %720, float addrspace(3)* %54, align 4, !tbaa !5
  %721 = add nuw nsw i32 %650, 61440
  %722 = add i32 %19, %721
  %723 = sext i32 %722 to i64
  %724 = getelementptr inbounds float, float addrspace(1)* %1, i64 %723
  %725 = load float, float addrspace(1)* %724, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %725, float addrspace(3)* %56, align 4, !tbaa !5
  %726 = add nuw nsw i32 %650, 63488
  %727 = add i32 %19, %726
  %728 = sext i32 %727 to i64
  %729 = getelementptr inbounds float, float addrspace(1)* %1, i64 %728
  %730 = load float, float addrspace(1)* %729, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %730, float addrspace(3)* %58, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %731 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %10
  %732 = load float, float addrspace(3)* %731, align 4, !tbaa !5
  %733 = load float, float addrspace(3)* %59, align 4, !tbaa !5
  %734 = fmul contract float %732, %733
  %735 = load float, float addrspace(3)* %27, align 4, !tbaa !5
  %736 = fadd contract float %735, %734
  store float %736, float addrspace(3)* %27, align 4, !tbaa !5
  %737 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %60
  %738 = load float, float addrspace(3)* %737, align 4, !tbaa !5
  %739 = load float, float addrspace(3)* %62, align 4, !tbaa !5
  %740 = fmul contract float %738, %739
  %741 = fadd contract float %736, %740
  store float %741, float addrspace(3)* %27, align 4, !tbaa !5
  %742 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %63
  %743 = load float, float addrspace(3)* %742, align 4, !tbaa !5
  %744 = load float, float addrspace(3)* %65, align 4, !tbaa !5
  %745 = fmul contract float %743, %744
  %746 = fadd contract float %741, %745
  store float %746, float addrspace(3)* %27, align 4, !tbaa !5
  %747 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %66
  %748 = load float, float addrspace(3)* %747, align 4, !tbaa !5
  %749 = load float, float addrspace(3)* %68, align 4, !tbaa !5
  %750 = fmul contract float %748, %749
  %751 = fadd contract float %746, %750
  store float %751, float addrspace(3)* %27, align 4, !tbaa !5
  %752 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %69
  %753 = load float, float addrspace(3)* %752, align 4, !tbaa !5
  %754 = load float, float addrspace(3)* %71, align 4, !tbaa !5
  %755 = fmul contract float %753, %754
  %756 = fadd contract float %751, %755
  store float %756, float addrspace(3)* %27, align 4, !tbaa !5
  %757 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %72
  %758 = load float, float addrspace(3)* %757, align 4, !tbaa !5
  %759 = load float, float addrspace(3)* %74, align 4, !tbaa !5
  %760 = fmul contract float %758, %759
  %761 = fadd contract float %756, %760
  store float %761, float addrspace(3)* %27, align 4, !tbaa !5
  %762 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %75
  %763 = load float, float addrspace(3)* %762, align 4, !tbaa !5
  %764 = load float, float addrspace(3)* %77, align 4, !tbaa !5
  %765 = fmul contract float %763, %764
  %766 = fadd contract float %761, %765
  store float %766, float addrspace(3)* %27, align 4, !tbaa !5
  %767 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %78
  %768 = load float, float addrspace(3)* %767, align 4, !tbaa !5
  %769 = load float, float addrspace(3)* %80, align 4, !tbaa !5
  %770 = fmul contract float %768, %769
  %771 = fadd contract float %766, %770
  store float %771, float addrspace(3)* %27, align 4, !tbaa !5
  %772 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %81
  %773 = load float, float addrspace(3)* %772, align 4, !tbaa !5
  %774 = load float, float addrspace(3)* %83, align 4, !tbaa !5
  %775 = fmul contract float %773, %774
  %776 = fadd contract float %771, %775
  store float %776, float addrspace(3)* %27, align 4, !tbaa !5
  %777 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %84
  %778 = load float, float addrspace(3)* %777, align 4, !tbaa !5
  %779 = load float, float addrspace(3)* %86, align 4, !tbaa !5
  %780 = fmul contract float %778, %779
  %781 = fadd contract float %776, %780
  store float %781, float addrspace(3)* %27, align 4, !tbaa !5
  %782 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %87
  %783 = load float, float addrspace(3)* %782, align 4, !tbaa !5
  %784 = load float, float addrspace(3)* %89, align 4, !tbaa !5
  %785 = fmul contract float %783, %784
  %786 = fadd contract float %781, %785
  store float %786, float addrspace(3)* %27, align 4, !tbaa !5
  %787 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %90
  %788 = load float, float addrspace(3)* %787, align 4, !tbaa !5
  %789 = load float, float addrspace(3)* %92, align 4, !tbaa !5
  %790 = fmul contract float %788, %789
  %791 = fadd contract float %786, %790
  store float %791, float addrspace(3)* %27, align 4, !tbaa !5
  %792 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %93
  %793 = load float, float addrspace(3)* %792, align 4, !tbaa !5
  %794 = load float, float addrspace(3)* %95, align 4, !tbaa !5
  %795 = fmul contract float %793, %794
  %796 = fadd contract float %791, %795
  store float %796, float addrspace(3)* %27, align 4, !tbaa !5
  %797 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %96
  %798 = load float, float addrspace(3)* %797, align 4, !tbaa !5
  %799 = load float, float addrspace(3)* %98, align 4, !tbaa !5
  %800 = fmul contract float %798, %799
  %801 = fadd contract float %796, %800
  store float %801, float addrspace(3)* %27, align 4, !tbaa !5
  %802 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %99
  %803 = load float, float addrspace(3)* %802, align 4, !tbaa !5
  %804 = load float, float addrspace(3)* %101, align 4, !tbaa !5
  %805 = fmul contract float %803, %804
  %806 = fadd contract float %801, %805
  store float %806, float addrspace(3)* %27, align 4, !tbaa !5
  %807 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %102
  %808 = load float, float addrspace(3)* %807, align 4, !tbaa !5
  %809 = load float, float addrspace(3)* %104, align 4, !tbaa !5
  %810 = fmul contract float %808, %809
  %811 = fadd contract float %806, %810
  store float %811, float addrspace(3)* %27, align 4, !tbaa !5
  %812 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %105
  %813 = load float, float addrspace(3)* %812, align 4, !tbaa !5
  %814 = load float, float addrspace(3)* %107, align 4, !tbaa !5
  %815 = fmul contract float %813, %814
  %816 = fadd contract float %811, %815
  store float %816, float addrspace(3)* %27, align 4, !tbaa !5
  %817 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %108
  %818 = load float, float addrspace(3)* %817, align 4, !tbaa !5
  %819 = load float, float addrspace(3)* %110, align 4, !tbaa !5
  %820 = fmul contract float %818, %819
  %821 = fadd contract float %816, %820
  store float %821, float addrspace(3)* %27, align 4, !tbaa !5
  %822 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %111
  %823 = load float, float addrspace(3)* %822, align 4, !tbaa !5
  %824 = load float, float addrspace(3)* %113, align 4, !tbaa !5
  %825 = fmul contract float %823, %824
  %826 = fadd contract float %821, %825
  store float %826, float addrspace(3)* %27, align 4, !tbaa !5
  %827 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %114
  %828 = load float, float addrspace(3)* %827, align 4, !tbaa !5
  %829 = load float, float addrspace(3)* %116, align 4, !tbaa !5
  %830 = fmul contract float %828, %829
  %831 = fadd contract float %826, %830
  store float %831, float addrspace(3)* %27, align 4, !tbaa !5
  %832 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %117
  %833 = load float, float addrspace(3)* %832, align 4, !tbaa !5
  %834 = load float, float addrspace(3)* %119, align 4, !tbaa !5
  %835 = fmul contract float %833, %834
  %836 = fadd contract float %831, %835
  store float %836, float addrspace(3)* %27, align 4, !tbaa !5
  %837 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %120
  %838 = load float, float addrspace(3)* %837, align 4, !tbaa !5
  %839 = load float, float addrspace(3)* %122, align 4, !tbaa !5
  %840 = fmul contract float %838, %839
  %841 = fadd contract float %836, %840
  store float %841, float addrspace(3)* %27, align 4, !tbaa !5
  %842 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %123
  %843 = load float, float addrspace(3)* %842, align 4, !tbaa !5
  %844 = load float, float addrspace(3)* %125, align 4, !tbaa !5
  %845 = fmul contract float %843, %844
  %846 = fadd contract float %841, %845
  store float %846, float addrspace(3)* %27, align 4, !tbaa !5
  %847 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %126
  %848 = load float, float addrspace(3)* %847, align 4, !tbaa !5
  %849 = load float, float addrspace(3)* %128, align 4, !tbaa !5
  %850 = fmul contract float %848, %849
  %851 = fadd contract float %846, %850
  store float %851, float addrspace(3)* %27, align 4, !tbaa !5
  %852 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %129
  %853 = load float, float addrspace(3)* %852, align 4, !tbaa !5
  %854 = load float, float addrspace(3)* %131, align 4, !tbaa !5
  %855 = fmul contract float %853, %854
  %856 = fadd contract float %851, %855
  store float %856, float addrspace(3)* %27, align 4, !tbaa !5
  %857 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %132
  %858 = load float, float addrspace(3)* %857, align 4, !tbaa !5
  %859 = load float, float addrspace(3)* %134, align 4, !tbaa !5
  %860 = fmul contract float %858, %859
  %861 = fadd contract float %856, %860
  store float %861, float addrspace(3)* %27, align 4, !tbaa !5
  %862 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %135
  %863 = load float, float addrspace(3)* %862, align 4, !tbaa !5
  %864 = load float, float addrspace(3)* %137, align 4, !tbaa !5
  %865 = fmul contract float %863, %864
  %866 = fadd contract float %861, %865
  store float %866, float addrspace(3)* %27, align 4, !tbaa !5
  %867 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %138
  %868 = load float, float addrspace(3)* %867, align 4, !tbaa !5
  %869 = load float, float addrspace(3)* %140, align 4, !tbaa !5
  %870 = fmul contract float %868, %869
  %871 = fadd contract float %866, %870
  store float %871, float addrspace(3)* %27, align 4, !tbaa !5
  %872 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %141
  %873 = load float, float addrspace(3)* %872, align 4, !tbaa !5
  %874 = load float, float addrspace(3)* %143, align 4, !tbaa !5
  %875 = fmul contract float %873, %874
  %876 = fadd contract float %871, %875
  store float %876, float addrspace(3)* %27, align 4, !tbaa !5
  %877 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %144
  %878 = load float, float addrspace(3)* %877, align 4, !tbaa !5
  %879 = load float, float addrspace(3)* %146, align 4, !tbaa !5
  %880 = fmul contract float %878, %879
  %881 = fadd contract float %876, %880
  store float %881, float addrspace(3)* %27, align 4, !tbaa !5
  %882 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %147
  %883 = load float, float addrspace(3)* %882, align 4, !tbaa !5
  %884 = load float, float addrspace(3)* %149, align 4, !tbaa !5
  %885 = fmul contract float %883, %884
  %886 = fadd contract float %881, %885
  store float %886, float addrspace(3)* %27, align 4, !tbaa !5
  %887 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %150
  %888 = load float, float addrspace(3)* %887, align 4, !tbaa !5
  %889 = load float, float addrspace(3)* %152, align 4, !tbaa !5
  %890 = fmul contract float %888, %889
  %891 = fadd contract float %886, %890
  store float %891, float addrspace(3)* %27, align 4, !tbaa !5
  %892 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %153
  %893 = load float, float addrspace(3)* %892, align 4, !tbaa !5
  %894 = load float, float addrspace(3)* %155, align 4, !tbaa !5
  %895 = fmul contract float %893, %894
  %896 = fadd contract float %891, %895
  store float %896, float addrspace(3)* %27, align 4, !tbaa !5
  %897 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %156
  %898 = load float, float addrspace(3)* %897, align 4, !tbaa !5
  %899 = load float, float addrspace(3)* %158, align 4, !tbaa !5
  %900 = fmul contract float %898, %899
  %901 = fadd contract float %896, %900
  store float %901, float addrspace(3)* %27, align 4, !tbaa !5
  %902 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %159
  %903 = load float, float addrspace(3)* %902, align 4, !tbaa !5
  %904 = load float, float addrspace(3)* %161, align 4, !tbaa !5
  %905 = fmul contract float %903, %904
  %906 = fadd contract float %901, %905
  store float %906, float addrspace(3)* %27, align 4, !tbaa !5
  %907 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %162
  %908 = load float, float addrspace(3)* %907, align 4, !tbaa !5
  %909 = load float, float addrspace(3)* %164, align 4, !tbaa !5
  %910 = fmul contract float %908, %909
  %911 = fadd contract float %906, %910
  store float %911, float addrspace(3)* %27, align 4, !tbaa !5
  %912 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %165
  %913 = load float, float addrspace(3)* %912, align 4, !tbaa !5
  %914 = load float, float addrspace(3)* %167, align 4, !tbaa !5
  %915 = fmul contract float %913, %914
  %916 = fadd contract float %911, %915
  store float %916, float addrspace(3)* %27, align 4, !tbaa !5
  %917 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %168
  %918 = load float, float addrspace(3)* %917, align 4, !tbaa !5
  %919 = load float, float addrspace(3)* %170, align 4, !tbaa !5
  %920 = fmul contract float %918, %919
  %921 = fadd contract float %916, %920
  store float %921, float addrspace(3)* %27, align 4, !tbaa !5
  %922 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %171
  %923 = load float, float addrspace(3)* %922, align 4, !tbaa !5
  %924 = load float, float addrspace(3)* %173, align 4, !tbaa !5
  %925 = fmul contract float %923, %924
  %926 = fadd contract float %921, %925
  store float %926, float addrspace(3)* %27, align 4, !tbaa !5
  %927 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %174
  %928 = load float, float addrspace(3)* %927, align 4, !tbaa !5
  %929 = load float, float addrspace(3)* %176, align 4, !tbaa !5
  %930 = fmul contract float %928, %929
  %931 = fadd contract float %926, %930
  store float %931, float addrspace(3)* %27, align 4, !tbaa !5
  %932 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %177
  %933 = load float, float addrspace(3)* %932, align 4, !tbaa !5
  %934 = load float, float addrspace(3)* %179, align 4, !tbaa !5
  %935 = fmul contract float %933, %934
  %936 = fadd contract float %931, %935
  store float %936, float addrspace(3)* %27, align 4, !tbaa !5
  %937 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %180
  %938 = load float, float addrspace(3)* %937, align 4, !tbaa !5
  %939 = load float, float addrspace(3)* %182, align 4, !tbaa !5
  %940 = fmul contract float %938, %939
  %941 = fadd contract float %936, %940
  store float %941, float addrspace(3)* %27, align 4, !tbaa !5
  %942 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %183
  %943 = load float, float addrspace(3)* %942, align 4, !tbaa !5
  %944 = load float, float addrspace(3)* %185, align 4, !tbaa !5
  %945 = fmul contract float %943, %944
  %946 = fadd contract float %941, %945
  store float %946, float addrspace(3)* %27, align 4, !tbaa !5
  %947 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %186
  %948 = load float, float addrspace(3)* %947, align 4, !tbaa !5
  %949 = load float, float addrspace(3)* %188, align 4, !tbaa !5
  %950 = fmul contract float %948, %949
  %951 = fadd contract float %946, %950
  store float %951, float addrspace(3)* %27, align 4, !tbaa !5
  %952 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %189
  %953 = load float, float addrspace(3)* %952, align 4, !tbaa !5
  %954 = load float, float addrspace(3)* %191, align 4, !tbaa !5
  %955 = fmul contract float %953, %954
  %956 = fadd contract float %951, %955
  store float %956, float addrspace(3)* %27, align 4, !tbaa !5
  %957 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %192
  %958 = load float, float addrspace(3)* %957, align 4, !tbaa !5
  %959 = load float, float addrspace(3)* %194, align 4, !tbaa !5
  %960 = fmul contract float %958, %959
  %961 = fadd contract float %956, %960
  store float %961, float addrspace(3)* %27, align 4, !tbaa !5
  %962 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %195
  %963 = load float, float addrspace(3)* %962, align 4, !tbaa !5
  %964 = load float, float addrspace(3)* %197, align 4, !tbaa !5
  %965 = fmul contract float %963, %964
  %966 = fadd contract float %961, %965
  store float %966, float addrspace(3)* %27, align 4, !tbaa !5
  %967 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %198
  %968 = load float, float addrspace(3)* %967, align 4, !tbaa !5
  %969 = load float, float addrspace(3)* %200, align 4, !tbaa !5
  %970 = fmul contract float %968, %969
  %971 = fadd contract float %966, %970
  store float %971, float addrspace(3)* %27, align 4, !tbaa !5
  %972 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %201
  %973 = load float, float addrspace(3)* %972, align 4, !tbaa !5
  %974 = load float, float addrspace(3)* %203, align 4, !tbaa !5
  %975 = fmul contract float %973, %974
  %976 = fadd contract float %971, %975
  store float %976, float addrspace(3)* %27, align 4, !tbaa !5
  %977 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %204
  %978 = load float, float addrspace(3)* %977, align 4, !tbaa !5
  %979 = load float, float addrspace(3)* %206, align 4, !tbaa !5
  %980 = fmul contract float %978, %979
  %981 = fadd contract float %976, %980
  store float %981, float addrspace(3)* %27, align 4, !tbaa !5
  %982 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %207
  %983 = load float, float addrspace(3)* %982, align 4, !tbaa !5
  %984 = load float, float addrspace(3)* %209, align 4, !tbaa !5
  %985 = fmul contract float %983, %984
  %986 = fadd contract float %981, %985
  store float %986, float addrspace(3)* %27, align 4, !tbaa !5
  %987 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %210
  %988 = load float, float addrspace(3)* %987, align 4, !tbaa !5
  %989 = load float, float addrspace(3)* %212, align 4, !tbaa !5
  %990 = fmul contract float %988, %989
  %991 = fadd contract float %986, %990
  store float %991, float addrspace(3)* %27, align 4, !tbaa !5
  %992 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %213
  %993 = load float, float addrspace(3)* %992, align 4, !tbaa !5
  %994 = load float, float addrspace(3)* %215, align 4, !tbaa !5
  %995 = fmul contract float %993, %994
  %996 = fadd contract float %991, %995
  store float %996, float addrspace(3)* %27, align 4, !tbaa !5
  %997 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %216
  %998 = load float, float addrspace(3)* %997, align 4, !tbaa !5
  %999 = load float, float addrspace(3)* %218, align 4, !tbaa !5
  %1000 = fmul contract float %998, %999
  %1001 = fadd contract float %996, %1000
  store float %1001, float addrspace(3)* %27, align 4, !tbaa !5
  %1002 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %219
  %1003 = load float, float addrspace(3)* %1002, align 4, !tbaa !5
  %1004 = load float, float addrspace(3)* %221, align 4, !tbaa !5
  %1005 = fmul contract float %1003, %1004
  %1006 = fadd contract float %1001, %1005
  store float %1006, float addrspace(3)* %27, align 4, !tbaa !5
  %1007 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %222
  %1008 = load float, float addrspace(3)* %1007, align 4, !tbaa !5
  %1009 = load float, float addrspace(3)* %224, align 4, !tbaa !5
  %1010 = fmul contract float %1008, %1009
  %1011 = fadd contract float %1006, %1010
  store float %1011, float addrspace(3)* %27, align 4, !tbaa !5
  %1012 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %225
  %1013 = load float, float addrspace(3)* %1012, align 4, !tbaa !5
  %1014 = load float, float addrspace(3)* %227, align 4, !tbaa !5
  %1015 = fmul contract float %1013, %1014
  %1016 = fadd contract float %1011, %1015
  store float %1016, float addrspace(3)* %27, align 4, !tbaa !5
  %1017 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %228
  %1018 = load float, float addrspace(3)* %1017, align 4, !tbaa !5
  %1019 = load float, float addrspace(3)* %230, align 4, !tbaa !5
  %1020 = fmul contract float %1018, %1019
  %1021 = fadd contract float %1016, %1020
  store float %1021, float addrspace(3)* %27, align 4, !tbaa !5
  %1022 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %231
  %1023 = load float, float addrspace(3)* %1022, align 4, !tbaa !5
  %1024 = load float, float addrspace(3)* %233, align 4, !tbaa !5
  %1025 = fmul contract float %1023, %1024
  %1026 = fadd contract float %1021, %1025
  store float %1026, float addrspace(3)* %27, align 4, !tbaa !5
  %1027 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %234
  %1028 = load float, float addrspace(3)* %1027, align 4, !tbaa !5
  %1029 = load float, float addrspace(3)* %236, align 4, !tbaa !5
  %1030 = fmul contract float %1028, %1029
  %1031 = fadd contract float %1026, %1030
  store float %1031, float addrspace(3)* %27, align 4, !tbaa !5
  %1032 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %237
  %1033 = load float, float addrspace(3)* %1032, align 4, !tbaa !5
  %1034 = load float, float addrspace(3)* %239, align 4, !tbaa !5
  %1035 = fmul contract float %1033, %1034
  %1036 = fadd contract float %1031, %1035
  store float %1036, float addrspace(3)* %27, align 4, !tbaa !5
  %1037 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %240
  %1038 = load float, float addrspace(3)* %1037, align 4, !tbaa !5
  %1039 = load float, float addrspace(3)* %242, align 4, !tbaa !5
  %1040 = fmul contract float %1038, %1039
  %1041 = fadd contract float %1036, %1040
  store float %1041, float addrspace(3)* %27, align 4, !tbaa !5
  %1042 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %243
  %1043 = load float, float addrspace(3)* %1042, align 4, !tbaa !5
  %1044 = load float, float addrspace(3)* %245, align 4, !tbaa !5
  %1045 = fmul contract float %1043, %1044
  %1046 = fadd contract float %1041, %1045
  store float %1046, float addrspace(3)* %27, align 4, !tbaa !5
  %1047 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %246
  %1048 = load float, float addrspace(3)* %1047, align 4, !tbaa !5
  %1049 = load float, float addrspace(3)* %248, align 4, !tbaa !5
  %1050 = fmul contract float %1048, %1049
  %1051 = fadd contract float %1046, %1050
  store float %1051, float addrspace(3)* %27, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %1052 = shl nsw i32 %6, 11
  %1053 = sext i32 %1052 to i64
  %1054 = getelementptr inbounds float, float addrspace(1)* %4, i64 %1053
  %1055 = sext i32 %18 to i64
  %1056 = getelementptr inbounds float, float addrspace(1)* %1054, i64 %1055
  %1057 = load float, float addrspace(3)* %26, align 4, !tbaa !5
  %1058 = load float, float addrspace(3)* %27, align 4, !tbaa !5
  %1059 = fmul contract float %1057, %1058
  %1060 = load float, float addrspace(3)* %23, align 4, !tbaa !5
  %1061 = fadd contract float %1059, %1060
  %1062 = shl nuw nsw i32 %9, 9
  %1063 = add nuw nsw i32 %1062, %8
  %1064 = zext i32 %1063 to i64
  %1065 = getelementptr inbounds float, float addrspace(1)* %1056, i64 %1064
  store float %1061, float addrspace(1)* %1065, align 4, !tbaa !5
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

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

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
