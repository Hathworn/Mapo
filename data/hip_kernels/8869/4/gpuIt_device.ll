; ModuleID = '../data/hip_kernels/8869/4/main.cu'
source_filename = "../data/hip_kernels/8869/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z5gpuItPfS_S_iiiff(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, i32 %3, i32 %4, i32 %5, float %6, float %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %12 = getelementptr i8, i8 addrspace(4)* %11, i64 4
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 4, !range !5, !invariant.load !6
  %15 = zext i16 %14 to i32
  %16 = mul i32 %10, %15
  %17 = add i32 %16, %9
  %18 = mul nsw i32 %4, %3
  %19 = mul nsw i32 %18, %5
  %20 = icmp slt i32 %17, %19
  br i1 %20, label %21, label %229

21:                                               ; preds = %8
  %22 = icmp eq i32 %17, 0
  br i1 %22, label %23, label %37

23:                                               ; preds = %21
  %24 = load float, float addrspace(1)* %1, align 4, !tbaa !7, !amdgpu.noclobber !6
  %25 = getelementptr inbounds float, float addrspace(1)* %1, i64 1
  %26 = load float, float addrspace(1)* %25, align 4, !tbaa !7, !amdgpu.noclobber !6
  %27 = fadd contract float %24, %26
  %28 = fadd contract float %24, %27
  %29 = sext i32 %3 to i64
  %30 = getelementptr inbounds float, float addrspace(1)* %1, i64 %29
  %31 = load float, float addrspace(1)* %30, align 4, !tbaa !7, !amdgpu.noclobber !6
  %32 = fadd contract float %31, %28
  %33 = fmul contract float %24, 4.000000e+00
  %34 = fsub contract float %32, %33
  %35 = fmul contract float %34, %6
  %36 = fadd contract float %24, %35
  store float %36, float addrspace(1)* %0, align 4, !tbaa !7
  br label %222

37:                                               ; preds = %21
  %38 = add nsw i32 %3, -1
  %39 = icmp eq i32 %17, %38
  br i1 %39, label %40, label %60

40:                                               ; preds = %37
  %41 = sext i32 %17 to i64
  %42 = getelementptr inbounds float, float addrspace(1)* %1, i64 %41
  %43 = load float, float addrspace(1)* %42, align 4, !tbaa !7, !amdgpu.noclobber !6
  %44 = add nsw i32 %17, -1
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds float, float addrspace(1)* %1, i64 %45
  %47 = load float, float addrspace(1)* %46, align 4, !tbaa !7, !amdgpu.noclobber !6
  %48 = fadd contract float %43, %47
  %49 = fadd contract float %43, %48
  %50 = add nsw i32 %17, %3
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds float, float addrspace(1)* %1, i64 %51
  %53 = load float, float addrspace(1)* %52, align 4, !tbaa !7, !amdgpu.noclobber !6
  %54 = fadd contract float %53, %49
  %55 = fmul contract float %43, 4.000000e+00
  %56 = fsub contract float %54, %55
  %57 = fmul contract float %56, %6
  %58 = fadd contract float %43, %57
  %59 = getelementptr inbounds float, float addrspace(1)* %0, i64 %41
  store float %58, float addrspace(1)* %59, align 4, !tbaa !7
  br label %222

60:                                               ; preds = %37
  %61 = add nsw i32 %18, -1
  %62 = icmp eq i32 %17, %61
  br i1 %62, label %63, label %83

63:                                               ; preds = %60
  %64 = sext i32 %17 to i64
  %65 = getelementptr inbounds float, float addrspace(1)* %1, i64 %64
  %66 = load float, float addrspace(1)* %65, align 4, !tbaa !7, !amdgpu.noclobber !6
  %67 = add nsw i32 %17, -1
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds float, float addrspace(1)* %1, i64 %68
  %70 = load float, float addrspace(1)* %69, align 4, !tbaa !7, !amdgpu.noclobber !6
  %71 = fadd contract float %66, %70
  %72 = sub nsw i32 %17, %3
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds float, float addrspace(1)* %1, i64 %73
  %75 = load float, float addrspace(1)* %74, align 4, !tbaa !7, !amdgpu.noclobber !6
  %76 = fadd contract float %71, %75
  %77 = fadd contract float %66, %76
  %78 = fmul contract float %66, 4.000000e+00
  %79 = fsub contract float %77, %78
  %80 = fmul contract float %79, %6
  %81 = fadd contract float %66, %80
  %82 = getelementptr inbounds float, float addrspace(1)* %0, i64 %64
  store float %81, float addrspace(1)* %82, align 4, !tbaa !7
  br label %222

83:                                               ; preds = %60
  %84 = sub nsw i32 %18, %3
  %85 = icmp eq i32 %17, %84
  br i1 %85, label %86, label %106

86:                                               ; preds = %83
  %87 = sext i32 %17 to i64
  %88 = getelementptr inbounds float, float addrspace(1)* %1, i64 %87
  %89 = load float, float addrspace(1)* %88, align 4, !tbaa !7, !amdgpu.noclobber !6
  %90 = add nsw i32 %17, 1
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds float, float addrspace(1)* %1, i64 %91
  %93 = load float, float addrspace(1)* %92, align 4, !tbaa !7, !amdgpu.noclobber !6
  %94 = fadd contract float %89, %93
  %95 = sub nsw i32 %17, %3
  %96 = sext i32 %95 to i64
  %97 = getelementptr inbounds float, float addrspace(1)* %1, i64 %96
  %98 = load float, float addrspace(1)* %97, align 4, !tbaa !7, !amdgpu.noclobber !6
  %99 = fadd contract float %94, %98
  %100 = fadd contract float %89, %99
  %101 = fmul contract float %89, 4.000000e+00
  %102 = fsub contract float %100, %101
  %103 = fmul contract float %102, %6
  %104 = fadd contract float %89, %103
  %105 = getelementptr inbounds float, float addrspace(1)* %0, i64 %87
  store float %104, float addrspace(1)* %105, align 4, !tbaa !7
  br label %222

106:                                              ; preds = %83
  %107 = srem i32 %17, %3
  %108 = icmp eq i32 %107, 0
  br i1 %108, label %109, label %133

109:                                              ; preds = %106
  %110 = sext i32 %17 to i64
  %111 = getelementptr inbounds float, float addrspace(1)* %1, i64 %110
  %112 = load float, float addrspace(1)* %111, align 4, !tbaa !7, !amdgpu.noclobber !6
  %113 = add nsw i32 %17, 1
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds float, float addrspace(1)* %1, i64 %114
  %116 = load float, float addrspace(1)* %115, align 4, !tbaa !7, !amdgpu.noclobber !6
  %117 = fadd contract float %112, %116
  %118 = sub nsw i32 %17, %3
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds float, float addrspace(1)* %1, i64 %119
  %121 = load float, float addrspace(1)* %120, align 4, !tbaa !7, !amdgpu.noclobber !6
  %122 = fadd contract float %117, %121
  %123 = add nsw i32 %17, %3
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds float, float addrspace(1)* %1, i64 %124
  %126 = load float, float addrspace(1)* %125, align 4, !tbaa !7, !amdgpu.noclobber !6
  %127 = fadd contract float %122, %126
  %128 = fmul contract float %112, 4.000000e+00
  %129 = fsub contract float %127, %128
  %130 = fmul contract float %129, %6
  %131 = fadd contract float %112, %130
  %132 = getelementptr inbounds float, float addrspace(1)* %0, i64 %110
  store float %131, float addrspace(1)* %132, align 4, !tbaa !7
  br label %222

133:                                              ; preds = %106
  %134 = icmp eq i32 %107, %38
  br i1 %134, label %135, label %159

135:                                              ; preds = %133
  %136 = sext i32 %17 to i64
  %137 = getelementptr inbounds float, float addrspace(1)* %1, i64 %136
  %138 = load float, float addrspace(1)* %137, align 4, !tbaa !7, !amdgpu.noclobber !6
  %139 = add nsw i32 %17, -1
  %140 = sext i32 %139 to i64
  %141 = getelementptr inbounds float, float addrspace(1)* %1, i64 %140
  %142 = load float, float addrspace(1)* %141, align 4, !tbaa !7, !amdgpu.noclobber !6
  %143 = fadd contract float %138, %142
  %144 = sub nsw i32 %17, %3
  %145 = sext i32 %144 to i64
  %146 = getelementptr inbounds float, float addrspace(1)* %1, i64 %145
  %147 = load float, float addrspace(1)* %146, align 4, !tbaa !7, !amdgpu.noclobber !6
  %148 = fadd contract float %143, %147
  %149 = add nsw i32 %17, %3
  %150 = sext i32 %149 to i64
  %151 = getelementptr inbounds float, float addrspace(1)* %1, i64 %150
  %152 = load float, float addrspace(1)* %151, align 4, !tbaa !7, !amdgpu.noclobber !6
  %153 = fadd contract float %148, %152
  %154 = fmul contract float %138, 4.000000e+00
  %155 = fsub contract float %153, %154
  %156 = fmul contract float %155, %6
  %157 = fadd contract float %138, %156
  %158 = getelementptr inbounds float, float addrspace(1)* %0, i64 %136
  store float %157, float addrspace(1)* %158, align 4, !tbaa !7
  br label %222

159:                                              ; preds = %133
  %160 = sub nsw i32 %17, %3
  %161 = icmp slt i32 %160, 0
  br i1 %161, label %162, label %186

162:                                              ; preds = %159
  %163 = sext i32 %17 to i64
  %164 = getelementptr inbounds float, float addrspace(1)* %1, i64 %163
  %165 = load float, float addrspace(1)* %164, align 4, !tbaa !7, !amdgpu.noclobber !6
  %166 = add nsw i32 %17, 1
  %167 = sext i32 %166 to i64
  %168 = getelementptr inbounds float, float addrspace(1)* %1, i64 %167
  %169 = load float, float addrspace(1)* %168, align 4, !tbaa !7, !amdgpu.noclobber !6
  %170 = add nsw i32 %17, -1
  %171 = sext i32 %170 to i64
  %172 = getelementptr inbounds float, float addrspace(1)* %1, i64 %171
  %173 = load float, float addrspace(1)* %172, align 4, !tbaa !7, !amdgpu.noclobber !6
  %174 = fadd contract float %169, %173
  %175 = fadd contract float %165, %174
  %176 = add nsw i32 %17, %3
  %177 = sext i32 %176 to i64
  %178 = getelementptr inbounds float, float addrspace(1)* %1, i64 %177
  %179 = load float, float addrspace(1)* %178, align 4, !tbaa !7, !amdgpu.noclobber !6
  %180 = fadd contract float %179, %175
  %181 = fmul contract float %165, 4.000000e+00
  %182 = fsub contract float %180, %181
  %183 = fmul contract float %182, %6
  %184 = fadd contract float %165, %183
  %185 = getelementptr inbounds float, float addrspace(1)* %0, i64 %163
  store float %184, float addrspace(1)* %185, align 4, !tbaa !7
  br label %222

186:                                              ; preds = %159
  %187 = add nsw i32 %17, %3
  %188 = icmp sgt i32 %187, %18
  %189 = sext i32 %17 to i64
  %190 = getelementptr inbounds float, float addrspace(1)* %1, i64 %189
  %191 = load float, float addrspace(1)* %190, align 4, !tbaa !7
  %192 = add nsw i32 %17, 1
  %193 = sext i32 %192 to i64
  %194 = getelementptr inbounds float, float addrspace(1)* %1, i64 %193
  %195 = load float, float addrspace(1)* %194, align 4, !tbaa !7
  %196 = add nsw i32 %17, -1
  %197 = sext i32 %196 to i64
  %198 = getelementptr inbounds float, float addrspace(1)* %1, i64 %197
  %199 = load float, float addrspace(1)* %198, align 4, !tbaa !7
  %200 = fadd contract float %195, %199
  %201 = zext i32 %160 to i64
  %202 = getelementptr inbounds float, float addrspace(1)* %1, i64 %201
  %203 = load float, float addrspace(1)* %202, align 4, !tbaa !7
  %204 = fadd contract float %200, %203
  br i1 %188, label %205, label %212

205:                                              ; preds = %186
  %206 = fadd contract float %191, %204
  %207 = fmul contract float %191, 4.000000e+00
  %208 = fsub contract float %206, %207
  %209 = fmul contract float %208, %6
  %210 = fadd contract float %191, %209
  %211 = getelementptr inbounds float, float addrspace(1)* %0, i64 %189
  store float %210, float addrspace(1)* %211, align 4, !tbaa !7
  br label %222

212:                                              ; preds = %186
  %213 = sext i32 %187 to i64
  %214 = getelementptr inbounds float, float addrspace(1)* %1, i64 %213
  %215 = load float, float addrspace(1)* %214, align 4, !tbaa !7, !amdgpu.noclobber !6
  %216 = fadd contract float %204, %215
  %217 = fmul contract float %191, 4.000000e+00
  %218 = fsub contract float %216, %217
  %219 = fmul contract float %218, %6
  %220 = fadd contract float %191, %219
  %221 = getelementptr inbounds float, float addrspace(1)* %0, i64 %189
  store float %220, float addrspace(1)* %221, align 4, !tbaa !7
  br label %222

222:                                              ; preds = %40, %86, %135, %205, %212, %162, %109, %63, %23
  %223 = phi i64 [ %41, %40 ], [ %87, %86 ], [ %136, %135 ], [ %189, %205 ], [ %189, %212 ], [ %163, %162 ], [ %110, %109 ], [ %64, %63 ], [ 0, %23 ]
  %224 = getelementptr inbounds float, float addrspace(1)* %2, i64 %223
  %225 = load float, float addrspace(1)* %224, align 4, !tbaa !7
  %226 = fcmp contract une float %225, %7
  br i1 %226, label %227, label %229

227:                                              ; preds = %222
  %228 = getelementptr inbounds float, float addrspace(1)* %0, i64 %223
  store float %225, float addrspace(1)* %228, align 4, !tbaa !7
  br label %229

229:                                              ; preds = %222, %227, %8
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
